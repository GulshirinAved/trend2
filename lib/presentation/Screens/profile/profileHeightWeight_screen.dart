import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trend_marketplace2/blocs/profile/checkUserAgreement/check_user_info_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_checkBox.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/custom_textField.dart';

class ProfileHeightWeightScreen extends StatefulWidget {
  const ProfileHeightWeightScreen({super.key});

  @override
  State<ProfileHeightWeightScreen> createState() =>
      _ProfileHeightWeightScreenState();
}

class _ProfileHeightWeightScreenState extends State<ProfileHeightWeightScreen> {
  late TextEditingController nameController;
  late TextEditingController mailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    mailController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckUserInfoBloc(),
      child: Scaffold(
        appBar: CustomAppBar.leadingWithTitle('User Informatiom'),
        body: Container(
          color: AppColors.whiteColor,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //textField that need to fill info
              UserTextField(
                controller: nameController,
                hintText: 'Name',
                iconname: userBoldIcon,
              ),
              UserTextField(
                controller: mailController,
                hintText: 'Amanamanov@gmail.com',
                iconname: smsIcon,
              ),
              UserTextField(
                controller: phoneController,
                hintText: 'Phone number',
                iconname: callIcon,
              ),
              //checkbox agreement
              Text(
                'Institutional',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFonts.font14,
                ),
              ),
              BlocBuilder<CheckUserInfoBloc, CheckUserInfoState>(
                builder: (context, state) {
                  return CustomCheckbox(
                    checkBox: state.isChecked,
                    onTap: (value) {
                      context
                          .read<CheckUserInfoBloc>()
                          .add(CheckUserInfoEvent(value!));
                    },
                    title:
                        'I want to be informed about opportunities for my workplace shopping',
                  );
                },
              ),
              //Save button
              Button(onTap: () {}, title: 'Save'),
            ],
          ),
        ),
      ),
    );
  }
}

class UserTextField extends StatelessWidget {
  const UserTextField({
    required this.controller,
    required this.hintText,
    required this.iconname,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final String iconname;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          SvgPicture.asset(iconname),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: CustomTextField.normal(
              controller: controller,
              hintText: hintText,
              validator: (value) {
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
