import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/blocs/signin_bloc/passwordObscure_bloc/password_obscure_bloc.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/custom_textField.dart';
import 'package:trend_marketplace2/presentation/Screens/login/signin_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/login/verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return BlocProvider(
      create: (context) => PasswordObscureBloc(),
      child: Scaffold(
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
              child: Padding(
                padding: const EdgeInsets.all(8.0).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //name
                    Text(
                      'trend',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppFonts.font56,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'New season trend products are waiting for you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AppFonts.font14,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //dialog
            Padding(
              padding: const EdgeInsets.all(10.0).r,
              child: Align(
                alignment: Alignment.center,
                child: Container(
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //phoneNumber textField
                        Padding(
                          padding: const EdgeInsets.all(20.0).r,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20).w,
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
                                      .add(const PasswordConfirmEvent());
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
                        //forget password
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 5.h, right: 20.w),
                            child: Text(
                              'forget password',
                              style: TextStyle(
                                color: AppColors.blueColor,
                                fontSize: AppFonts.font10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        //login button
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 15.h,
                          ),
                          child: Button(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                pushReplacementWithoutNavBar(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const VerificationScreen(),
                                  ),
                                );
                              }
                            },
                            title: 'Log in',
                          ),
                        ),
                        //sign in
                        GestureDetector(
                          onTap: () {
                            pushReplacementWithoutNavBar(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SigninScreen(),
                              ),
                            );
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
