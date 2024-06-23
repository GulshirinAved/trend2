// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;
  FontWeight? fontWeight;

  CustomRadioButton({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      visualDensity: VisualDensity.compact,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.darkGrey1Color,
          fontSize: AppFonts.font12,
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
      ),
      value: value,
      groupValue: groupValue,
      activeColor: AppColors.blueColor,
      onChanged: onChanged,
    );
  }
}
