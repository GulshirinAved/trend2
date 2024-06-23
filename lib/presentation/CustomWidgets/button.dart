import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final bool? cartButton;
  final String title;
  final double? width;
  final Color? backColor;
  final Color? borderColor;
  final Color? textColor;
  final double? textSize;

  const Button({
    required this.onTap,
    required this.title,
    this.width,
    this.cartButton = false,
    this.backColor,
    this.borderColor,
    this.textColor,
    this.textSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: width ?? MediaQuery.of(context).size.width,
      color: backColor ?? AppColors.blueColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? Colors.transparent),
        borderRadius: AppBorderRadius.borderRadius8,
      ),
      onPressed: onTap,
      child: cartButton == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  cartIcon,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: AppFonts.font10,
                  ),
                ),
              ],
            )
          : Text(
              title,
              style: TextStyle(
                color: textColor ?? AppColors.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: textSize ?? AppFonts.font16,
              ),
            ),
    );
  }
}
