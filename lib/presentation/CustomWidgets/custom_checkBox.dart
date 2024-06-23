import 'package:flutter/material.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class CustomCheckbox extends StatelessWidget {
  final bool checkBox;
  final String title;
  final Function(bool? value)? onTap;

  const CustomCheckbox({
    required this.checkBox,
    required this.onTap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      tileColor: Colors.transparent,
      checkColor: AppColors.whiteColor,
      fillColor: WidgetStatePropertyAll(
        checkBox ? AppColors.blueColor : AppColors.whiteColor,
      ),
      checkboxShape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.borderRadius2,
        side: BorderSide(
          color: checkBox ? AppColors.blueColor : AppColors.grey7Color,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.borderRadius2,
        side: BorderSide(
          color: checkBox ? AppColors.blueColor : Colors.transparent,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Text(
        title,
        style: TextStyle(
          color: checkBox ? AppColors.darkGrey1Color : AppColors.grey8Color,
        ),
      ),
      value: checkBox,
      onChanged: onTap,
    );
  }
}
