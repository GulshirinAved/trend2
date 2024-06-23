import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.title,
    this.isBold = false,
    super.key,
  });

  final String? title;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5.h, left: 8.w),
        fillColor: AppColors.lightGreyColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGrey1Color.withOpacity(0.1),
          ),
          borderRadius: AppBorderRadius.borderRadius12,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: AppBorderRadius.borderRadius12,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: AppBorderRadius.borderRadius12,
        ),
        hintText: title,
        hintStyle: TextStyle(
          color: AppColors.lightGrey1Color,
          fontWeight: isBold == false ? FontWeight.w400 : FontWeight.w600,
          fontSize: AppFonts.font14,
        ),
        suffixIcon: SvgPicture.asset(
          searchIcon,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
