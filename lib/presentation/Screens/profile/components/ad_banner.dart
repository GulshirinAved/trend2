import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: AppBorderRadius.borderRadius8,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Special offer for you',
                  style: TextStyle(
                    color: AppColors.darkGrey1Color,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFonts.font14,
                  ),
                ),
                //get detailed button
                Container(
                  padding: const EdgeInsets.all(5).r,
                  decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: AppBorderRadius.borderRadius12,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Get detailed',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: AppFonts.font8,
                        ),
                      ),
                      SvgPicture.asset(
                        arrowRightIcon,
                        colorFilter: ColorFilter.mode(
                          AppColors.whiteColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //image
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                banner2Image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
