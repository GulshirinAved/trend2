import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/topTitle.dart';

class BrandSlider extends StatelessWidget {
  const BrandSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopTitle(
          title: 'Brands',
          onTap: () {},
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 90.h,
          color: AppColors.whiteColor,
          padding: EdgeInsets.only(top: 10.h),
          margin: EdgeInsets.only(top: 10.h),
          child: ListView.builder(
            itemCount: brands.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 75,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.lightGrey1Color,
                          width: 1,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          brands[index]['image'],
                        ),
                      ),
                    ),
                    Text(
                      brands[index]['title'],
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.darkGrey1Color,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFonts.font12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
