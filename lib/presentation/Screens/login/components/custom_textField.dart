import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

enum TextFieldStyle { phoneNumber, password, normal }

class CustomTextField extends StatelessWidget {
  final TextFieldStyle textFieldStyle;
  final TextEditingController controller;
  final String? hintText;
  final bool? obscure;
  final bool? isDigit;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? hintColor;
  final VoidCallback? onTap;

  const CustomTextField({
    required this.controller,
    required this.textFieldStyle,
    required this.validator,
    this.onTap,
    this.hintText,
    this.obscure = false,
    this.isDigit,
    this.borderColor,
    this.hintColor,
    super.key,
  });
  CustomTextField._({
    required this.textFieldStyle,
    required this.controller,
    required this.validator,
    this.onTap,
    this.hintText,
    this.obscure,
    this.isDigit,
    this.borderColor,
    this.hintColor,
  });
  factory CustomTextField.withPhoneNumber({
    required TextEditingController controller,
    required String hintText,
    final String? Function(String?)? validator,
  }) {
    return CustomTextField._(
      textFieldStyle: TextFieldStyle.phoneNumber,
      controller: controller,
      hintText: hintText,
      validator: validator,
    );
  }
  factory CustomTextField.withPassword({
    required TextEditingController controller,
    required String hintText,
    required bool obscure,
    required final String? Function(String?)? validator,
    required VoidCallback onTap,
  }) {
    return CustomTextField._(
      textFieldStyle: TextFieldStyle.password,
      controller: controller,
      hintText: hintText,
      obscure: obscure,
      validator: validator,
      onTap: onTap,
    );
  }
  factory CustomTextField.normal({
    required TextEditingController controller,
    required String hintText,
    required final String? Function(String?)? validator,
    bool? isDigit,
    Color? borderColor,
    Color? hintColor,
  }) {
    return CustomTextField._(
      textFieldStyle: TextFieldStyle.normal,
      controller: controller,
      hintText: hintText,
      validator: validator,
      isDigit: isDigit,
      borderColor: borderColor,
      hintColor: hintColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      controller: controller,
      obscureText: textFieldStyle == TextFieldStyle.phoneNumber
          ? false
          : obscure ?? false,
      keyboardType: textFieldStyle == TextFieldStyle.phoneNumber ||
              textFieldStyle == TextFieldStyle.normal && isDigit == true
          ? TextInputType.phone
          : TextInputType.text,
      inputFormatters: textFieldStyle == TextFieldStyle.phoneNumber
          ? [
              FilteringTextInputFormatter.digitsOnly,
              PhoneInputFormatter(),
            ]
          : textFieldStyle == TextFieldStyle.normal && isDigit == true
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                ]
              : null,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: textFieldStyle == TextFieldStyle.phoneNumber
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '+(993)',
                      style: TextStyle(
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: AppFonts.font14,
                      ),
                    ),
                  ),
                ],
              )
            : null,
        suffixIcon: textFieldStyle == TextFieldStyle.password
            ? GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(
                  obscure == true ? eyeSlashIcon : eyeIcon,
                  fit: BoxFit.scaleDown,
                ),
              )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: AppFonts.font12,
          fontWeight: FontWeight.w400,
          color: hintColor ?? AppColors.darkGreyColor,
        ),
        prefixStyle: TextStyle(
          color: AppColors.darkGreyColor,
          fontWeight: FontWeight.w400,
          fontSize: AppFonts.font14,
        ),
        fillColor: AppColors.greyColor.withOpacity(0.6),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
          borderRadius: AppBorderRadius.borderRadius8,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
          borderRadius: AppBorderRadius.borderRadius8,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
          borderRadius: AppBorderRadius.borderRadius8,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: AppBorderRadius.borderRadius8,
        ),
      ),
    );
  }
}

//for underscore in phoneNumber
class PhoneInputFormatter extends TextInputFormatter {
  PhoneInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return const TextEditingValue();
    }

    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (newText.length < 8) {
      newText = newText.padRight(8, ' _');
    }

    int cursorPosition = min(newValue.text.length, 8);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
