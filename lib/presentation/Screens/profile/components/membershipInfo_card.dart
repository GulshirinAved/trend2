import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/custom_textField.dart';

class MemberShipInfoCard extends StatelessWidget {
  const MemberShipInfoCard({
    required this.nameController,
    required this.emailController,
    required this.phonenumberController,
    super.key,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phonenumberController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16).copyWith(top: 0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: AppBorderRadius.borderRadius6,
        border: Border.all(
          color: AppColors.grey16Color,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'My Membership Information',
              style: TextStyle(
                color: AppColors.blueColor,
                fontWeight: FontWeight.w400,
                fontSize: AppFonts.font14,
              ),
            ),
          ),
          Divider(
            color: AppColors.grey19Color,
          ),
          //textfields
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //name and surname textfield
                Row(
                  children: [
                    Expanded(
                      child: TextFieldWithTopTitle(
                        controller: nameController,
                        topTitle: 'Name',
                        hintText: 'Aman',
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Expanded(
                      child: TextFieldWithTopTitle(
                        controller: nameController,
                        topTitle: 'Name',
                        hintText: 'Aman',
                      ),
                    ),
                  ],
                ),
                //email textfield
                TextFieldWithTopTitle(
                  controller: emailController,
                  topTitle: 'E-mail',
                  hintText: 'Aman',
                ),
                //phone number textfield
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone number',
                      style: TextStyle(
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: AppFonts.font10,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 52.h,
                          width: 100.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withOpacity(0.6),
                            borderRadius: AppBorderRadius.borderRadius8,
                          ),
                          child: Text(
                            '+993',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.grey5Color,
                              fontSize: AppFonts.font14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomTextField.normal(
                              controller: phonenumberController,
                              hintText: '8023456789',
                              isDigit: true,
                              hintColor: AppColors.grey5Color,
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //save button
                Button(onTap: () {}, title: 'Save'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldWithTopTitle extends StatelessWidget {
  const TextFieldWithTopTitle({
    required this.controller,
    required this.topTitle,
    required this.hintText,
    super.key,
  });

  final TextEditingController controller;
  final String? topTitle;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topTitle!,
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w400,
              fontSize: AppFonts.font10,
            ),
          ),
          CustomTextField.normal(
            controller: controller,
            hintText: hintText!,
            validator: (value) {
              return null;
            },
          ),
        ],
      ),
    );
  }
}
