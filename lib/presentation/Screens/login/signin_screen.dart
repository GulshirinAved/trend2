// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/blocs/signin_bloc/checkAgreement/check_agreement_bloc.dart';
import 'package:trend_marketplace2/blocs/signin_bloc/genderSelection_bloc/gender_selection_bloc.dart';

import 'package:trend_marketplace2/blocs/signin_bloc/passwordObscure_bloc/password_obscure_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_checkBox.dart';
import 'package:trend_marketplace2/presentation/Screens/bottomNavBar/bottomNavBar_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/custom_textField.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/gender_card.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/trendName.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PasswordObscureBloc(),
        ),
        BlocProvider(
          create: (context) => GenderSelectionBloc(),
        ),
        BlocProvider(
          create: (context) => CheckAgreementBloc(),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                //background
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
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: AppColors.whiteColor),
                  ),
                ),
              ],
            ),
            //top name and dialog
            SingleChildScrollView(
              child: Column(
                children: [
                  trendName(context),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
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
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //phoneNumber textField
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: CustomTextField.withPhoneNumber(
                                    controller: _phoneController,
                                    hintText: '_ _ _ _ _ _ _ _',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your phone number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                //password Textfield
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: BlocBuilder<PasswordObscureBloc,
                                      PasswordObscureState>(
                                    builder: (context, state) {
                                      return CustomTextField.withPassword(
                                        controller: _passwordController,
                                        hintText: '*********',
                                        obscure: state.isObscure1,
                                        onTap: () {
                                          context
                                              .read<PasswordObscureBloc>()
                                              .add(
                                                const PasswordConfirmEvent(),
                                              );
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          return null;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //explanation of textfield
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            child: Text.rich(
                              TextSpan(
                                text: 'Your password must be at least',
                                style: TextStyle(
                                  color: AppColors.grey5Color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppFonts.font10,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' 10 characters.',
                                    style:
                                        TextStyle(color: AppColors.blackColor),
                                  ),
                                  const TextSpan(text: ' It must contain '),
                                  TextSpan(
                                    text:
                                        '1 uppercase letter, 1 lowercase letter',
                                    style:
                                        TextStyle(color: AppColors.blackColor),
                                  ),
                                  const TextSpan(text: ' and a '),
                                  TextSpan(
                                    text: 'number',
                                    style:
                                        TextStyle(color: AppColors.blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //gender selection
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GenderCard(
                                index: 0,
                                title: 'Female',
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(8).r,
                                  bottomLeft: const Radius.circular(8).r,
                                  topRight: const Radius.circular(0).r,
                                  bottomRight: const Radius.circular(0).r,
                                ),
                              ),
                              GenderCard(
                                index: 1,
                                title: 'Male',
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(0).r,
                                  bottomLeft: const Radius.circular(0).r,
                                  topRight: const Radius.circular(8).r,
                                  bottomRight: const Radius.circular(8).r,
                                ),
                              ),
                            ],
                          ),
                          //chackBox agreement
                          Column(
                            children: List.generate(
                              signInAgreement.length,
                              (index) => BlocBuilder<CheckAgreementBloc,
                                  CheckAgreementState>(
                                builder: (context, state) {
                                  return CustomCheckbox(
                                    checkBox: state.checkList[index],
                                    title: signInAgreement[index]['text'],
                                    onTap: (value) {
                                      context
                                          .read<CheckAgreementBloc>()
                                          .add(CheckAgreementEvent(index));
                                    },
                                  );
                                },
                              ),
                            ),
                          ),

                          //login button
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ).copyWith(bottom: 10),
                            child: Button(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  pushScreenWithNavBar(context, BottomNavBar());
                                }
                              },
                              title: 'Sign up',
                            ),
                          ),
                          //sign in
                          GestureDetector(
                            onTap: () {
                              pushScreenWithoutNavBar(context, SigninScreen());
                            },
                            child: Text.rich(
                              TextSpan(
                                text: 'Not a member?',
                                style: TextStyle(
                                  color: AppColors.darkGreyColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppFonts.font12,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' Sign in',
                                    style: TextStyle(
                                      color: AppColors.blueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppFonts.font12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
