import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/profile_button.dart';

class FollowingStoresCard extends StatelessWidget {
  const FollowingStoresCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.grey16Color,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(
              10.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //branc image
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5.w),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey19Color,
                          ),
                          shape: BoxShape.circle),
                      child: Image.asset(
                        brand1Image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    //brand name and followers
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name and verify icon
                        Row(
                          children: [
                            Text(
                              'Riccon',
                              style: TextStyle(
                                color: AppColors.darkGrey1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: AppFonts.font10,
                              ),
                            ),
                            SvgPicture.asset(verifyIcon),
                          ],
                        ),
                        Text(
                          '25,5K followers',
                          style: TextStyle(
                            color: AppColors.grey1Color,
                            fontWeight: FontWeight.w600,
                            fontSize: AppFonts.font12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //store button
                ProfileButton(
                  index: 0,
                  onTap: () {},
                  title: 'Store',
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.grey19Color,
          ),
          //sellers product title and images
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seller\'s Products',
                  style: TextStyle(
                    color: AppColors.grey1Color,
                    fontSize: AppFonts.font10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  height: 83.h,
                  margin: EdgeInsets.only(top: 10.h),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ClipRRect(
                      borderRadius: AppBorderRadius.borderRadius4,
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: Image.asset(
                          manCloth1Image,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
