// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/blocs/carts/cart_bloc/cart_bloc.dart';

import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/cart_button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/fav_button.dart';
import 'package:trend_marketplace2/presentation/Screens/home/productProfile_screen.dart';

class ProductCard extends StatelessWidget {
  final CartItem cartItem;
  final FavItem favItem;
  final int index;
  const ProductCard({
    required this.cartItem,
    required this.favItem,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushScreenWithoutNavBar(
        context,
        ProductProfileScreen(
          cartItem: cartItem,
          favItem: favItem,
        ),
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final isItemInCart =
              state.cartList.any((item) => item.id == cartItem.id);
          return Container(
            width: MediaQuery.of(context).size.width * 0.45,
            margin: const EdgeInsets.all(5).r,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3).r,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: AppBorderRadius.borderRadius12,
              boxShadow: isItemInCart
                  ? [
                      BoxShadow(
                        color: isItemInCart
                            ? AppColors.blackColor.withOpacity(0.1)
                            : Colors.transparent,
                        blurRadius: 10,
                      ),
                    ]
                  : [],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    //image
                    ClipRRect(
                      borderRadius: AppBorderRadius.borderRadius8,
                      child: Image.asset(
                        topProducts[index].image,
                        height: 149.h,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    //discount container
                    topProducts[index].discount != null
                        ? Positioned(
                            left: 5.w,
                            top: 6.h,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.w,
                                vertical: 1.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.redColor,
                                borderRadius: AppBorderRadius.borderRadius4,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '- ${topProducts[index].discount.toString()} %',
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppFonts.font8,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    //fav button
                    Positioned(
                      right: 5.w,
                      top: 6.h,
                      child: FavButton(
                        favItem: favItem,
                      ),
                    ),
                  ],
                ),
                //price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${topProducts[index].price.toString()} TMT',
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: AppFonts.font14,
                      ),
                    ),
                    topProducts[index].previousPrice != null
                        ? Text(
                            '${topProducts[index].previousPrice.toString()} TMT',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.grey1Color,
                              fontWeight: FontWeight.w400,
                              fontSize: AppFonts.font12,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                //brand and desc
                Text.rich(
                  maxLines: 2,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: topProducts[index].brand.toString(),
                        style: TextStyle(
                          color: AppColors.darkGrey1Color,
                          fontWeight: FontWeight.w400,
                          fontSize: AppFonts.font12,
                        ),
                      ),
                      TextSpan(
                        text: '/${topProducts[index].desc}',
                        style: TextStyle(
                          color: AppColors.grey1Color,
                          fontWeight: FontWeight.w400,
                          fontSize: AppFonts.font12,
                        ),
                      ),
                    ],
                  ),
                ),
                //Rating
                Row(
                  children: [
                    SvgPicture.asset(starIcon),
                    SizedBox(
                      width: 1.5.w,
                    ),
                    Text(topProducts[index].starRating),
                  ],
                ),
                //button for ordering
                Flexible(child: CartButton(cartItem: cartItem)),
              ],
            ),
          );
        },
      ),
    );
  }
}
