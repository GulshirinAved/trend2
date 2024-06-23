import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/buyAgain_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/followingStores_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/orders_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/productsVisitedBefore_screen.dart';

class ProfileCards extends StatelessWidget {
  const ProfileCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: profileCarditems.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.6,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            pushScreenWithNavBar(
              context,
              index == 0
                  ? const OrdersScreen()
                  : index == 1
                      ? const ProductsVisitedBeforeScreen()
                      : index == 2
                          ? const FollowingStoresScreen()
                          : const BuyAgainScreen(),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.borderRadius4,
              color: AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(profileCarditems[index]['icon']),
                SizedBox(
                  width: 90.w,
                  child: Text(
                    profileCarditems[index]['title'],
                    style: TextStyle(
                      color: AppColors.darkGrey4Color,
                      fontWeight: FontWeight.w400,
                      fontSize: AppFonts.font10,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  arrowRightIcon,
                  colorFilter: ColorFilter.mode(
                    AppColors.grey1Color,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
