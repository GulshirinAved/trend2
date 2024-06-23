import 'package:flutter/material.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class ProductNameAndImage extends StatelessWidget {
  const ProductNameAndImage({
    required this.imageName,
    super.key,
  });

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: AppBorderRadius.borderRadius4,
          child: Image.asset(
            imageName,
            height: 96,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Glorio jeans',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFonts.font14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Men’s Navy Blue Slim Fit Narrow Cut Mono Collar Suit',
                  style: TextStyle(
                    color: AppColors.grey2Color,
                    fontWeight: FontWeight.w400,
                    fontSize: AppFonts.font12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
