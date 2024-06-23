import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/blocs/allProducts/filterCheckSelection/filter_check_selection_bloc.dart';
import 'package:trend_marketplace2/blocs/allProducts/sort/sort_bloc.dart';
import 'package:trend_marketplace2/blocs/productProfile/cardSelection/card_selection_bloc.dart';
import 'package:trend_marketplace2/blocs/store/bloc/banner_scrolling_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_textfield.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/product_card.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/filterSort_card.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/filter_modalSheet.dart';
import 'package:trend_marketplace2/presentation/Screens/home/filter_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/profile_button.dart';
import 'package:trend_marketplace2/presentation/Screens/store/components/sellerProfile_tab.dart';
import 'package:trend_marketplace2/presentation/Screens/store/components/storeHome_tab.dart';

class StoreProfileScreen extends StatefulWidget {
  const StoreProfileScreen({super.key});

  @override
  State<StoreProfileScreen> createState() => _StoreProfileScreenState();
}

class _StoreProfileScreenState extends State<StoreProfileScreen> {
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BannerScrollingBloc(),
        ),
        BlocProvider(
          create: (context) => CardSelectionBloc(),
        ),
        BlocProvider(
          create: (context) => SortBloc(),
        ),
      ],
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                //appbar
                SliverAppBar(
                  expandedHeight: 105.h,
                  pinned: true,
                  floating: true,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      arrowLeftIcon,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  title: Row(
                    children: [
                      //brand avatar
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.lightGrey1Color,
                            width: 1,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            brands[0]['image'],
                          ),
                        ),
                      ),
                      //name and followers number
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'AVVA',
                                  style: TextStyle(
                                    color: innerBoxIsScrolled == true
                                        ? AppColors.blackColor
                                        : AppColors.whiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppFonts.font16,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SvgPicture.asset(
                                  verifyIcon,
                                  height: 14.h,
                                  width: 14.h,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Text(
                              '2.9M followers',
                              style: TextStyle(
                                color: innerBoxIsScrolled == true
                                    ? AppColors.blackColor
                                    : AppColors.whiteColor,
                                fontSize: AppFonts.font10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    //follow button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProfileButton(
                        index: 0,
                        title: 'Follow',
                        onTap: () {},
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        //background image
                        Image.asset(
                          storeBackgroundImage,
                          fit: BoxFit.fill,
                        ),
                        //search textfield
                        Positioned.fill(
                          left: 0,
                          right: 0,
                          top: 70.h,
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CustomTextField(
                              title: 'Search in store',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            //tabbars
            body: Container(
              color: AppColors.whiteColor,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Homepage'),
                      Tab(text: 'All products'),
                      Tab(text: 'Seller profile '),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        const StoreHomeTab(),
                        ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: filterSortList.length,
                                itemBuilder: (context, index) {
                                  return filterSortList[index]['title'] ==
                                          'Filters'
                                      ?
                                      //card with badge
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Badge(
                                            backgroundColor:
                                                AppColors.blueColor,
                                            label: Text(
                                              '1',
                                              style: TextStyle(
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: AppFonts.font8,
                                              ),
                                            ),
                                            alignment: Alignment.topRight,
                                            child: FilterSortCard(
                                              filterAndSort: filterSortList,
                                              index: index,
                                              onTap: () {
                                                pushScreenWithoutNavBar(
                                                  context,
                                                  const FilterScreen(),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      :
                                      //normal card
                                      Container(
                                          margin: const EdgeInsets.all(8),
                                          child: FilterSortCard(
                                            filterAndSort: filterSortList,
                                            index: index,
                                            onTap: () {
                                              context
                                                  .read<CardSelectionBloc>()
                                                  .add(
                                                    CardSelectionEvent(index),
                                                  );
                                            },
                                          ),
                                        );
                                },
                              ),
                            ),
                            BlocBuilder<CardSelectionBloc, CardSelectionState>(
                              builder: (context, state) {
                                return state.selectiedIndex == -1
                                    ? GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: topProducts.length,
                                        padding: EdgeInsets.zero,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 3 / 2,
                                          mainAxisExtent: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                        ),
                                        itemBuilder: (context, index) {
                                          return ProductCard(
                                            index: index,
                                            favItem: FavItem(
                                              id: topProducts[index].id,
                                              image: topProducts[index].image,
                                              price: topProducts[index].price,
                                              brand: topProducts[index].brand,
                                              desc: topProducts[index].desc,
                                              starRating:
                                                  topProducts[index].starRating,
                                              previousPrice: topProducts[index]
                                                  .previousPrice,
                                              discount:
                                                  topProducts[index].discount,
                                            ),
                                            cartItem: CartItem(
                                              id: topProducts[index].id,
                                              image: topProducts[index].image,
                                              price: topProducts[index].price,
                                              brand: topProducts[index].brand,
                                              desc: topProducts[index].desc,
                                              starRating:
                                                  topProducts[index].starRating,
                                              previousPrice: topProducts[index]
                                                  .previousPrice,
                                              discount:
                                                  topProducts[index].discount,
                                            ),
                                          );
                                        },
                                      )
                                    : Stack(
                                        children: [
                                          //all products
                                          GridView.builder(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: topProducts.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 3 / 2,
                                              mainAxisExtent:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                            ),
                                            itemBuilder: (context, index) {
                                              return ProductCard(
                                                index: index,
                                                favItem: FavItem(
                                                  id: topProducts[index].id,
                                                  image:
                                                      topProducts[index].image,
                                                  price:
                                                      topProducts[index].price,
                                                  brand:
                                                      topProducts[index].brand,
                                                  desc: topProducts[index].desc,
                                                  starRating: topProducts[index]
                                                      .starRating,
                                                  previousPrice:
                                                      topProducts[index]
                                                          .previousPrice,
                                                  discount: topProducts[index]
                                                      .discount,
                                                ),
                                                cartItem: CartItem(
                                                  id: topProducts[index].id,
                                                  image:
                                                      topProducts[index].image,
                                                  price:
                                                      topProducts[index].price,
                                                  brand:
                                                      topProducts[index].brand,
                                                  desc: topProducts[index].desc,
                                                  starRating: topProducts[index]
                                                      .starRating,
                                                  previousPrice:
                                                      topProducts[index]
                                                          .previousPrice,
                                                  discount: topProducts[index]
                                                      .discount,
                                                ),
                                              );
                                            },
                                          ),
                                          //darkness
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<CardSelectionBloc>()
                                                  .add(
                                                    const CardSelectionEvent(
                                                        -1),
                                                  );
                                              context
                                                  .read<
                                                      FilterCheckSelectionBloc>()
                                                  .add(CancelEvent());
                                            },
                                            child: BackdropFilter(
                                              blendMode: BlendMode.darken,
                                              filter: ImageFilter.blur(
                                                sigmaX: 0,
                                                sigmaY: 0,
                                              ),
                                              child: Container(
                                                color: AppColors.blackColor
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ),
                                          //filter top modal
                                          FilterTopModal(
                                            topCardTitle: filterSortList[
                                                state.selectiedIndex]['title'],
                                          ),
                                        ],
                                      );
                              },
                            ),
                          ],
                        ),
                        const SellerProfileTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
