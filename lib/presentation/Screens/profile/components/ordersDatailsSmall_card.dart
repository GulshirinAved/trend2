import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class OrdersDetailsSmallCard extends StatelessWidget {
  const OrdersDetailsSmallCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: ordersDetailsCard.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 65,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => ListTile(
          tileColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.borderRadius4,
          ),
          leading: SvgPicture.asset(
            height: 18.h,
            width: 18.h,
            ordersDetailsCard[index]['icon'],
            colorFilter: ColorFilter.mode(
              ordersDetailsCard[index]['color'] == 0
                  ? AppColors.blueColor
                  : ordersDetailsCard[index]['color'] == 1
                      ? AppColors.green1Color
                      : AppColors.darkGrey1Color,
              BlendMode.srcIn,
            ),
          ),
          title: Text(
            ordersDetailsCard[index]['title'],
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w400,
              fontSize: AppFonts.font8,
            ),
          ),
          subtitle: Text(
            ordersDetailsCard[index]['subtitle'],
            style: TextStyle(
              color: ordersDetailsCard[index]['textColor'] == 0
                  ? AppColors.blueColor
                  : ordersDetailsCard[index]['textColor'] == 1
                      ? AppColors.green1Color
                      : AppColors.darkGreyColor,
              fontWeight: FontWeight.w700,
              fontSize: AppFonts.font12,
            ),
          ),
        ),
      ),
    );
  }
}
