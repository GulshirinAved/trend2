import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class SellerProfileCards extends StatelessWidget {
  const SellerProfileCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 98.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: sellerProfileCard.length,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: Container(
            width: 110.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: AppBorderRadius.borderRadius4,
              border: Border.all(
                color: AppColors.grey16Color,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueColor.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    sellerProfileCard[index]['icon'],
                  ),
                ),
                Text(
                  sellerProfileCard[index]['title'],
                  style: TextStyle(
                    color: AppColors.darkGrey1Color,
                    fontWeight: FontWeight.w400,
                    fontSize: AppFonts.font10,
                  ),
                ),
                Text(
                  sellerProfileCard[index]['subTitle'],
                  style: TextStyle(
                    color: AppColors.darkGrey1Color,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFonts.font12,
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
