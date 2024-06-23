import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_marketplace2/blocs/signin_bloc/passwordObscure_bloc/password_obscure_bloc.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/custom_textField.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/membershipInfo_card.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController emailController;
  late TextEditingController phonenumberController;
  late TextEditingController currentpasswordController;
  late TextEditingController newpasswordController;
  late TextEditingController confirmpasswordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    emailController = TextEditingController();
    phonenumberController = TextEditingController();
    currentpasswordController = TextEditingController();
    newpasswordController = TextEditingController();
    confirmpasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    phonenumberController.dispose();
    currentpasswordController.dispose();
    newpasswordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordObscureBloc(),
      child: Scaffold(
        appBar: CustomAppBar.leadingWithTitle('User Information'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
            child: Column(
              children: [
                MemberShipInfoCard(
                  nameController: nameController,
                  emailController: emailController,
                  phonenumberController: phonenumberController,
                ),
                Container(
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
                          'Password Update',
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            //  current password
                            BlocBuilder<PasswordObscureBloc,
                                PasswordObscureState>(
                              builder: (context, state) {
                                return TextfieldWithTopTitle(
                                  controller: currentpasswordController,
                                  topTitle: 'Current Password',
                                  isObscure: state.isObscure2,
                                  onTap: () {
                                    context
                                        .read<PasswordObscureBloc>()
                                        .add(const PasswordCurrentEvent());
                                  },
                                );
                              },
                            ),
                            //new password
                            Column(
                              children: [
                                BlocBuilder<PasswordObscureBloc,
                                    PasswordObscureState>(
                                  builder: (context, state) {
                                    return TextfieldWithTopTitle(
                                        controller: newpasswordController,
                                        topTitle: 'New Password',
                                        isObscure: state.isObscure3,
                                        onTap: () {
                                          context
                                              .read<PasswordObscureBloc>()
                                              .add(const PasswordNewEvent());
                                        });
                                  },
                                ),
                                Text.rich(
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
                                        style: TextStyle(
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      const TextSpan(text: ' It must contain '),
                                      TextSpan(
                                        text:
                                            '1 uppercase letter, 1 lowercase letter',
                                        style: TextStyle(
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      const TextSpan(text: ' and a '),
                                      TextSpan(
                                        text: 'number',
                                        style: TextStyle(
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            BlocBuilder<PasswordObscureBloc,
                                PasswordObscureState>(
                              builder: (context, state) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: TextfieldWithTopTitle(
                                    controller: confirmpasswordController,
                                    topTitle: 'Confirm Password',
                                    isObscure: state.isObscure4,
                                    onTap: () {
                                      context
                                          .read<PasswordObscureBloc>()
                                          .add(const PasswordConfirm1Event());
                                    },
                                  ),
                                );
                              },
                            ),
                            Button(onTap: () {}, title: 'Save'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextfieldWithTopTitle extends StatelessWidget {
  const TextfieldWithTopTitle({
    required this.controller,
    required this.topTitle,
    required this.isObscure,
    required this.onTap,
    super.key,
  });

  final TextEditingController controller;
  final String topTitle;
  final bool? isObscure;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topTitle,
          style: TextStyle(
            color: AppColors.darkGreyColor,
            fontWeight: FontWeight.w400,
            fontSize: AppFonts.font12,
          ),
        ),
        CustomTextField.withPassword(
          controller: controller,
          hintText: '*********',
          obscure: isObscure ?? false,
          onTap: onTap,
          validator: (value) {
            return null;
          },
        ),
      ],
    );
  }
}
