import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/help_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/profileAddAddress_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/userInformation_screen.dart';

class MyAccauntCard extends StatelessWidget {
  const MyAccauntCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: AppBorderRadius.borderRadius8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(15).r,
            child: Text(
              'My Account',
              style: TextStyle(
                color: AppColors.darkGrey1Color,
                fontWeight: FontWeight.w600,
                fontSize: AppFonts.font14,
              ),
            ),
          ),
          Divider(
            color: AppColors.grey19Color,
          ),
          //user accunt tiles
          Column(
            children: List.generate(
              userAccauntitems.length,
              (index) {
                return GestureDetector(
                  onTap: () => pushScreenWithNavBar(
                    context,
                    index == 0
                        ? const UserProfileScreen()
                        : index == 1
                            ? const ProfileAddAddressScreen()
                            : const HelpScreen(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SvgPicture.asset(
                          userAccauntitems[index]['icon'],
                          height: 18.h,
                          width: 18.h,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          userAccauntitems[index]['title'],
                          style: TextStyle(
                            color: AppColors.darkGrey4Color,
                            fontSize: AppFonts.font12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      IconButton.filledTonal(
                        onPressed: () => pushScreenWithNavBar(
                          context,
                          index == 0
                              ? const UserProfileScreen()
                              : index == 1
                                  ? Container()
                                  : const HelpScreen(),
                        ),
                        constraints: const BoxConstraints(
                          maxHeight: 40,
                          maxWidth: 40,
                        ),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppColors.blueColor.withOpacity(0.15),
                          ),
                        ),
                        icon: SvgPicture.asset(
                          arrowRightIcon,
                          colorFilter: ColorFilter.mode(
                            AppColors.blueColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
