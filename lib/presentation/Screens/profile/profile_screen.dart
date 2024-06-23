import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/ad_banner.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/myAccaunt_card.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/profile_cards.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/userInfo_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            //info about user tile
            UserInfoTile(),
            //set of card
            ProfileCards(),
            //ad banner
            AdBanner(),
            //my accaunt card
            MyAccauntCard(),
          ],
        ),
      ),
    );
  }
}
