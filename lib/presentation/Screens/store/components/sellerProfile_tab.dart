import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/store/components/sellerProfileTime_cards.dart';
import 'package:trend_marketplace2/presentation/Screens/store/components/sellerProfile_cards.dart';

class SellerProfileTab extends StatelessWidget {
  const SellerProfileTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 15.h),
          children: const [
            SellerProfileCards(),
            SellerProfileTimeCards(),
          ],
        ),
      ),
    );
  }
}
