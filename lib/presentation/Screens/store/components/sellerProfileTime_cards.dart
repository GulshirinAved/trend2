import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class SellerProfileTimeCards extends StatelessWidget {
  const SellerProfileTimeCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 15.h),
      itemCount: sellerProfileTime.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(7),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
            color: AppColors.grey16Color,
          ),
          borderRadius: AppBorderRadius.borderRadius4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 53.h,
                  width: 53.h,
                  margin: EdgeInsets.only(right: 5.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey20Color.withOpacity(0.25),
                  ),
                  child: SvgPicture.asset(
                    sellerProfileTime[index]['icon'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Text(
                  sellerProfileTime[index]['title'],
                  style: TextStyle(
                    color: AppColors.darkGrey1Color,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFonts.font12,
                  ),
                ),
              ],
            ),
            Text(
              sellerProfileTime[index]['time'],
              style: TextStyle(
                color: AppColors.darkGrey1Color,
                fontWeight: FontWeight.w600,
                fontSize: AppFonts.font16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
