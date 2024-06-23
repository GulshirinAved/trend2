import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class CustomDropDown extends StatelessWidget {
  final String hintText;
  final double? width;
  final Function(String?)? onChanged;
  final bool? isBorder;
  final List<dynamic> items;
  final String? dropDownValue;
  final Color? dropDownColor;
  final double? height;

  const CustomDropDown({
    required this.hintText,
    required this.onChanged,
    required this.items,
    required this.dropDownValue,
    this.dropDownColor,
    this.height,
    this.width,
    this.isBorder = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 144.w,
      height: height ?? 52.h,
      child: DropdownButtonFormField<String?>(
        value: dropDownValue,
        isExpanded: true,
        isDense: true,
        menuMaxHeight: 250,
        elevation: 1,
        style: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w400,
          fontSize: AppFonts.font12,
        ),
        focusColor: dropDownColor ?? AppColors.greyColor.withOpacity(0.6),
        decoration: InputDecoration(
          filled: true,
          fillColor: dropDownColor ?? AppColors.greyColor.withOpacity(0.6),
          focusColor: dropDownColor ?? AppColors.greyColor.withOpacity(0.6),
          hoverColor: dropDownColor ?? AppColors.greyColor.withOpacity(0.6),
          border: OutlineInputBorder(
            borderRadius: AppBorderRadius.borderRadius8,
            borderSide: BorderSide(
              color: AppColors.grey18Color,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.borderRadius8,
            borderSide: isBorder == true
                ? BorderSide(
                    color: AppColors.grey18Color,
                  )
                : BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.borderRadius8,
            borderSide: isBorder == true
                ? BorderSide(
                    color: AppColors.grey18Color,
                  )
                : BorderSide.none,
          ),
        ),
        hint: Text(
          hintText,
          style: TextStyle(
            color: AppColors.darkGreyColor,
            fontWeight: FontWeight.w400,
            fontSize: AppFonts.font12,
          ),
        ),
        dropdownColor: AppColors.whiteColor,
        icon: SvgPicture.asset(
          arrowDownIcon,
          colorFilter: ColorFilter.mode(
            AppColors.darkGreyColor,
            BlendMode.srcIn,
          ),
        ),
        items: items.isNotEmpty
            ? items.toSet().map((e) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.bottomCenter,
                  value: e.id.toString(),
                  child: Text(e.name),
                );
              }).toList()
            : null,
        onChanged: onChanged,
      ),
    );
  }
}
