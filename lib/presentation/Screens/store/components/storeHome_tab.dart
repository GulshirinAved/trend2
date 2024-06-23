import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';

import 'package:trend_marketplace2/presentation/Screens/store/components/cloth_cards.dart';
import 'package:trend_marketplace2/presentation/Screens/store/components/coat_slider.dart';
import 'package:trend_marketplace2/presentation/Screens/store/components/jeans_slider.dart';
import 'package:trend_marketplace2/presentation/Screens/store/components/scrolling_banner.dart';
import 'package:trend_marketplace2/presentation/Screens/store/components/small_banner.dart';

class StoreHomeTab extends StatelessWidget {
  const StoreHomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        const ScrollingBanner(),
        //set of clothes
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: const ClothCards(),
        ),
        //banner
        Image.asset(storeBannerImage),
        //set of small banner
        const SmallBanner(),
        //coat slider
        const CoatSlider(),
        //jeans slider
        const JeansSlider(),
      ],
    );
  }
}
