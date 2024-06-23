import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/blocs/favbutton_bloc/fav_button_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/product_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.favorite('1'),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<FavButtonBloc, FavButtonState>(
          builder: (context, state) {
            if (state is FavButtonInitial || state.favList.isEmpty) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80.h,
                      width: 80.h,
                      padding: EdgeInsets.all(22.w),
                      margin: EdgeInsets.only(bottom: 20.h),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.blueColor.withOpacity(0.15),
                      ),
                      child: SvgPicture.asset(
                        favoriteIcon,
                        colorFilter: ColorFilter.mode(
                          AppColors.blueColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Text(
                      'Your Favorites List is Still Empty',
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFonts.font20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'No products found in your favorites list. You can add the products you want to your favorites by clicking the "Start Shopping" button.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.darkGrey1Color,
                          fontWeight: FontWeight.w400,
                          fontSize: AppFonts.font12,
                        ),
                      ),
                    ),
                    Button(
                      onTap: () {},
                      title: 'Start shopping',
                    ),
                  ],
                ),
              );
            } else if (state is SuccessState) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: state.favList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  mainAxisExtent: MediaQuery.of(context).size.width * 0.8,
                ),
                itemBuilder: (context, index) {
                  final favList = state.favList[index];
                  return ProductCard(
                    index: index,
                    favItem: FavItem(
                      id: favList.id,
                      image: favList.image,
                      price: favList.price,
                      brand: favList.brand,
                      desc: favList.desc,
                      starRating: favList.starRating,
                      previousPrice: favList.previousPrice,
                      discount: favList.discount,
                    ),
                    cartItem: CartItem(
                      id: favList.id,
                      image: favList.image,
                      price: favList.price,
                      brand: favList.brand,
                      desc: favList.desc,
                      starRating: favList.starRating,
                      previousPrice: favList.previousPrice,
                      discount: favList.discount,
                    ),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
