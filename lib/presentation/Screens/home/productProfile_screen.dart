// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'package:trend_marketplace2/blocs/productProfile/imageScrolling_bloc/image_scrolling_bloc.dart';
import 'package:trend_marketplace2/blocs/productProfile/sizeSelection_bloc/size_selection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/fav_button.dart';
import 'package:trend_marketplace2/presentation/Screens/bottomNavBar/profileBottomNavBar_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/aboutProduct_tile.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/color_tile.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/productName_tile.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/seeAlso_tile.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/sizeTile.dart';
import 'package:trend_marketplace2/presentation/Screens/home/imageProfile_screen.dart';

class ProductProfileScreen extends StatefulWidget {
  final CartItem cartItem;
  final FavItem favItem;

  const ProductProfileScreen({
    required this.cartItem,
    required this.favItem,
    super.key,
  });

  @override
  State<ProductProfileScreen> createState() => _ProductProfileScreenState();
}

class _ProductProfileScreenState extends State<ProductProfileScreen> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageScrollingBloc(),
        ),
        BlocProvider(
          create: (context) => SizeSelectionBloc(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: CustomAppBar.onlyWithSearch('T shirts (156 prosucts'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///image with favbutton and image psc
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SizedBox(
                        height: 434,
                        width: MediaQuery.of(context).size.width,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: manClothList.length,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {
                            context
                                .read<ImageScrollingBloc>()
                                .add(ImageScrollingEvent(value));
                          },
                          allowImplicitScrolling: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                pushScreenWithoutNavBar(
                                  context,
                                  ImageProfileScreen(
                                    imageList: manClothList,
                                  ),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  manClothList[index],
                                  height: 434,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          height: 30,
                          width: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: FavButton(
                            favItem: widget.favItem,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.darkGrey1Color.withOpacity(0.6),
                            borderRadius: AppBorderRadius.borderRadius10,
                          ),
                          child: BlocBuilder<ImageScrollingBloc,
                              ImageScrollingState>(
                            builder: (context, state) {
                              return Text(
                                'Pics ${(state.selectedIndex + 1).round()}/${manClothList.length}',
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: AppFonts.font10,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  //  productName and brand tile
                  const ProductTile(),
                  //  size modalsheet with name tile
                  const SizeTile(),
                  //  color tile
                  const ColorTile(),
                  //  about product tile
                  AboutProductTile(
                    favItem: widget.favItem,
                    cartItem: widget.cartItem,
                  ),
                  //  see also tile
                  const SeeAlsoTile(),
                ],
              ),
            ),
            bottomNavigationBar: ProfileBottomNavBar(
              cartItem: widget.cartItem,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
