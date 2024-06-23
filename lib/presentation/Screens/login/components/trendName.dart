import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

Widget trendName(BuildContext context) {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  return Column(
    mainAxisSize: MainAxisSize.max,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.w, top: deviceHeight(context) * 0.04.h),
          child: Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              arrowLeftIcon,
              colorFilter: ColorFilter.mode(
                AppColors.whiteColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      Text(
        'trend',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppFonts.font56,
          color: AppColors.whiteColor,
        ),
      ),
      Text(
        'New season trend products are waiting for you',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: AppFonts.font14,
          color: AppColors.whiteColor,
        ),
      ),
    ],
  );
}
