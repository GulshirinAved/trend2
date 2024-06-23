import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/orderDetails_screen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushScreenWithNavBar(context, const OrderDetailsScreen()),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
            color: AppColors.grey19Color,
          ),
          borderRadius: AppBorderRadius.borderRadius8,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 0.5,
              offset: const Offset(0, 1),
              color: AppColors.grey10Color.withOpacity(0.4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //image and image number
                Row(
                  children: [
                    const Stack(
                      children: [
                        CircleImage(
                          index: 0,
                        ),
                        CircleImage(
                          index: 1,
                        ),
                        CircleImage(
                          index: 2,
                          isNumber: true,
                        ),
                      ],
                    ),
                    //date and time
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '13:38',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: AppFonts.font12,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                        Text(
                          '23.12.2020',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: AppFonts.font12,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //total price and pay method
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '3253 TMT',
                          style: TextStyle(
                            color: AppColors.green1Color,
                            fontWeight: FontWeight.w500,
                            fontSize: AppFonts.font12,
                          ),
                        ),
                        Text(
                          'Credit card',
                          style: TextStyle(
                            color: AppColors.darkGreyColor,
                            fontWeight: FontWeight.w400,
                            fontSize: AppFonts.font10,
                          ),
                        ),
                      ],
                    ),
                    IconButton.filledTonal(
                      onPressed: () => pushScreenWithNavBar(
                        context,
                        const OrderDetailsScreen(),
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 22.h,
                        maxWidth: 22.h,
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.grey12Color,
                        ),
                      ),
                      icon: SvgPicture.asset(
                        arrowRightIcon,
                        colorFilter: ColorFilter.mode(
                          AppColors.black1Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset(handUpIcon),
                ),
                Text(
                  'Shipped',
                  style: TextStyle(
                    color: AppColors.green1Color,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFonts.font12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  final bool? isNumber;
  final double index;
  const CircleImage({required this.index, super.key, this.isNumber = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.h,
      margin: EdgeInsets.only(left: index * 25),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.grey3Color,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.grey3Color),
      ),
      child: isNumber == true
          ? Text(
              '+4',
              style: TextStyle(
                color: AppColors.darkGrey1Color,
                fontWeight: FontWeight.w400,
                fontSize: AppFonts.font14,
              ),
            )
          : ClipOval(
              child: Image.asset(
                manCloth1Image,
                height: 40.h,
                width: 40.h,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
