import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class SmallBanner extends StatelessWidget {
  const SmallBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: AppBorderRadius.borderRadius6,
        child: Image.asset(
          'assets/images/storeSmallBanner${index + 1}.png',
          height: 159.h,
          width: 198.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
