import 'package:flutter/material.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/brandName.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/originalTitle.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      ),
      padding: const EdgeInsets.all(10).copyWith(top: 0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Row(
              children: [
                BrandName(),
                OriginalTitle(),
              ],
            ),
          ),
          Text(
            'Men’s Navy Blue Slim Fit Narrow Cut Mono Collar Suit',
            maxLines: 2,
            style: TextStyle(
              color: AppColors.darkGrey1Color,
              fontWeight: FontWeight.w600,
              fontSize: AppFonts.font14,
            ),
          ),
        ],
      ),
    );
  }
}
