import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/custom_textField.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/trendName.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late TextEditingController _verificationControler;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _verificationControler = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 284.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.blueColor, AppColors.blue2Color],
              ),
            ),
            child: Column(
              children: [
                //name
                trendName(context),
              ],
            ),
          ),
          //dialog
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 272.h,
              width: 328.w,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: AppBorderRadius.borderRadius12,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: AppColors.blackColor.withOpacity(0.1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Verification',
                    style: TextStyle(
                      color: AppColors.black1Color,
                      fontWeight: FontWeight.w600,
                      fontSize: AppFonts.font24,
                    ),
                  ),
                  Text(
                    'Verification code sent to your phone number',
                    style: TextStyle(
                      color: AppColors.black1Color,
                      fontWeight: FontWeight.w400,
                      fontSize: AppFonts.font12,
                    ),
                  ),
                  //verification textField
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomTextField.normal(
                        controller: _verificationControler,
                        hintText: 'Verification Code',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your verification Code';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  //login button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ).copyWith(bottom: 20),
                    child: Button(onTap: () {}, title: 'Log in'),
                  ),
                  //sign in
                  Text.rich(
                    TextSpan(
                      text: 'Code didn’t recieved:',
                      style: TextStyle(
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: AppFonts.font12,
                      ),
                      children: [
                        TextSpan(
                          text: ' Send Again',
                          style: TextStyle(
                            color: AppColors.blueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppFonts.font12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _verificationControler.dispose();
    super.dispose();
  }
}
