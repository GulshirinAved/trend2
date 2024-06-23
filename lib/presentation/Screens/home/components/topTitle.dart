import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class TopTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool? isSeeAlso;
  const TopTitle({
    required this.title,
    required this.onTap,
    this.isSeeAlso = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
              fontSize: AppFonts.font14,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              isSeeAlso == false ? 'Discover more' : 'See also',
              style: isSeeAlso == false
                  ? TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: AppFonts.font10,
                    )
                  : TextStyle(
                      color: AppColors.blueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: AppFonts.font12,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
