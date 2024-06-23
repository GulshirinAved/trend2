import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class OriginalTitle extends StatelessWidget {
  const OriginalTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(verifyIcon),
        Text(
          'Original',
          style: TextStyle(
            color: AppColors.blue3Color,
            fontWeight: FontWeight.w400,
            fontSize: AppFonts.font12,
          ),
        ),
      ],
    );
  }
}
