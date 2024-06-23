// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/blocs/carts/cart_bloc/cart_bloc.dart';

import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';

import 'package:trend_marketplace2/presentation/Screens/cart/components/cart_button.dart';

class CartProductCard extends StatelessWidget {
  final CartItem cartItem;
  final int index;
  const CartProductCard({
    required this.cartItem,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //image
        ClipRRect(
          borderRadius: AppBorderRadius.borderRadius6,
          child: Image.asset(
            cartItem.image,
            height: 96.h,
            width: 72.w,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //description about cloth
              Text(
                'Oversized basic plain T-shirt',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: AppFonts.font12,
                ),
              ),
              //brand, size,color
              Row(
                children: [
                  Text(
                    cartItem.brand,
                    style: TextStyle(
                      color: AppColors.grey13Color,
                      fontWeight: FontWeight.w400,
                      fontSize: AppFonts.font10,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'Black',
                    style: TextStyle(
                      color: AppColors.grey13Color,
                      fontWeight: FontWeight.w400,
                      fontSize: AppFonts.font10,
                    ),
                  ),
                  Container(
                    height: 3.h,
                    width: 3.h,
                    margin: const EdgeInsets.symmetric(horizontal: 5).w,
                    decoration: BoxDecoration(
                      color: AppColors.grey13Color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    'L',
                    style: TextStyle(
                      color: AppColors.grey13Color,
                      fontWeight: FontWeight.w400,
                      fontSize: AppFonts.font10,
                    ),
                  ),
                ],
              ),
              //shipping time
              Text(
                'Estimated Shipping: within 5 days',
                style: TextStyle(
                  color: AppColors.darkGrey1Color,
                  fontWeight: FontWeight.w400,
                  fontSize: AppFonts.font10,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              //cart
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CartCountButton(
                      cartItem: cartItem,
                      index: index,
                    ),
                    Column(
                      children: [
                        Text(
                          '${cartItem.price.toString()} TMT',
                          style: TextStyle(
                            color: AppColors.redColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppFonts.font12,
                          ),
                        ),
                        cartItem.previousPrice == null
                            ? const SizedBox.shrink()
                            : Text(
                                '${cartItem.previousPrice.toString()} TMT',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: AppColors.grey13Color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppFonts.font10,
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<CartBloc>().add(RemoveCartEvent(cartItem: cartItem));
          },
          child: SvgPicture.asset(
            trashIcon,
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}
