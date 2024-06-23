import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class ProfileButton extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  final bool? isCart;
  final String? title;
  const ProfileButton({
    required this.index,
    required this.onTap,
    this.title,
    this.isCart = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 25.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
            color: AppColors.blueColor,
          ),
          borderRadius: AppBorderRadius.borderRadius6,
        ),
        child: isCart == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    cartIcon,
                    colorFilter: ColorFilter.mode(
                      AppColors.blueColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    'Cart',
                    style: TextStyle(
                      color: AppColors.blueColor,
                      fontWeight: FontWeight.w700,
                      fontSize: AppFonts.font10,
                    ),
                  ),
                ],
              )
            : Text(
                title!,
                style: TextStyle(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFonts.font10,
                ),
              ),
      ),
    );
  }
}
