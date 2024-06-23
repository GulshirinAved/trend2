import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/profileHeightWeight_screen.dart';

class UserInfoTile extends StatelessWidget {
  const UserInfoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //circle avatar
        Container(
          margin: const EdgeInsets.only(bottom: 7),
          height: 60.w,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.redColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              userBoldIcon,
              height: 32.w,
              width: 32.w,
              colorFilter: ColorFilter.mode(
                AppColors.whiteColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        //email and height,weight info
        Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Amanamanow@gmail.com',
                      style: TextStyle(
                        color: AppColors.darkGrey4Color,
                        fontWeight: FontWeight.w400,
                        fontSize: AppFonts.font12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => pushScreenWithNavBar(
                        context,
                        const ProfileHeightWeightScreen(),
                      ),
                      child: Text(
                        'Enter height and weight information',
                        style: TextStyle(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppFonts.font8,
                        ),
                      ),
                    ),
                  ],
                ),
                //approve button
                Container(
                  margin: const EdgeInsets.all(5).r,
                  padding: const EdgeInsets.all(5).r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: AppBorderRadius.borderRadius4,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'approve',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppFonts.font8,
                        ),
                      ),
                      SvgPicture.asset(
                        arrowRightIcon,
                        colorFilter: ColorFilter.mode(
                          AppColors.whiteColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        //notification button
        IconButton.filledTonal(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              AppColors.whiteColor,
            ),
          ),
          color: AppColors.whiteColor,
          onPressed: () {},
          icon: SvgPicture.asset(
            notificationIcon,
          ),
        ),
      ],
    );
  }
}
