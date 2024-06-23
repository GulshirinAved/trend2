import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/blocs/carts/cart_bloc/cart_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/addAddress_screen.dart';

class CartButtomSheet extends StatelessWidget {
  const CartButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                context.read<CartBloc>().add(SumProductEvent(cartItem: null));
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ///all  price list
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        border: Border.all(
                          color: AppColors.grey16Color,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: AppBorderRadius.borderRadius6,
                          border: Border.all(
                            color: AppColors.grey16Color,
                          ),
                        ),
                        child: Column(
                          children: [
                            textForPrice(
                              leftText: 'Estimated Shipping:',
                              rightText: '3 days',
                            ),
                            textForPrice(
                              leftText: 'Total of Product:',
                              rightText: '1758 tmt',
                            ),
                            textForPrice(
                              leftText: 'Shipping Total:',
                              rightText: '34.56 tmt',
                            ),
                            textForPrice(
                              leftText: 'Discount:',
                              rightText: '-37.56 tmt',
                            ),
                            Divider(
                              color: AppColors.grey14Color,
                              thickness: 1,
                            ),
                            BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                                return textForPrice(
                                  leftText: 'Total',
                                  rightText: '${state.sumDelivery} tmt',
                                  isTotal: true,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    //sum of the total price
                    Container(
                      height: 56.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.1),
                            blurRadius: 7.4,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            arrowDownIcon,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: AppFonts.font12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                children: [
                                  BlocBuilder<CartBloc, CartState>(
                                    builder: (context, state1) {
                                      return Text(
                                        '${state1.sum.toString()} tmt',
                                        style: TextStyle(
                                          color: AppColors.blueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: AppFonts.font16,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  BlocBuilder<CartBloc, CartState>(
                                    builder: (context, state1) {
                                      return Text(
                                        '${state1.sum.toString()} tmt',
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: AppColors.grey13Color,
                                          fontWeight: FontWeight.w400,
                                          fontSize: AppFonts.font10,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Button(
                            onTap: () {
                              pushScreenWithoutNavBar(
                                context,
                                const AddAdressScreen(),
                              );
                            },
                            title: 'Checkout',
                            width: 150.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            height: 56.h,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.1),
                  blurRadius: 7.4,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  arrowDownIcon,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: AppFonts.font12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state1) {
                            return Text(
                              '${state1.sum.toString()} tmt',
                              style: TextStyle(
                                color: AppColors.blueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: AppFonts.font16,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state1) {
                            return Text(
                              '${state1.sum.toString()} tmt',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.grey13Color,
                                fontWeight: FontWeight.w400,
                                fontSize: AppFonts.font10,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Button(
                  onTap: () {
                    pushScreenWithoutNavBar(
                      context,
                      const AddAdressScreen(),
                    );
                  },
                  title: 'Checkout',
                  width: 150.w,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Row textForPrice({
  required String leftText,
  required String rightText,
  bool? isTotal,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        leftText,
        style: TextStyle(
          color: AppColors.grey1Color,
          fontWeight: isTotal == true ? FontWeight.w600 : FontWeight.w400,
          fontSize: isTotal == true ? AppFonts.font12 : AppFonts.font10,
        ),
      ),
      Text(
        rightText,
        style: TextStyle(
          color: AppColors.darkGrey1Color,
          fontWeight: isTotal == true ? FontWeight.w600 : FontWeight.w400,
          fontSize: isTotal == true ? AppFonts.font12 : AppFonts.font10,
        ),
      ),
    ],
  );
}
