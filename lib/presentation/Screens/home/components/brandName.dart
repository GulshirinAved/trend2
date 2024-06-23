import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class BrandName extends StatelessWidget {
  const BrandName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.grey9Color,
        borderRadius: AppBorderRadius.borderRadius6,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Glorio jeans',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: AppFonts.font10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          SvgPicture.asset(arrowRightIcon),
        ],
      ),
    );
  }
}
