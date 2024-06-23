import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/brandSlider.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/storeSlider.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/topProducts_slider.dart';

class Woman extends StatefulWidget {
  const Woman({
    super.key,
  });

  @override
  State<Woman> createState() => _WomanState();
}

class _WomanState extends State<Woman> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      children: [
        //banner
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Image.asset(
            banner1Image,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),

        ///title and topProducts slider
        const TopProductsSlider(),

        ///title and brands slider
        const BrandSlider(),
        //banner
        Image.asset(
          banner2Image,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        //title and store slider
        const StoreSlider(),
        //small banner
        Container(
          height: 131,
          margin: const EdgeInsets.only(left: 16, top: 15),
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 8),
                child: Image.asset(
                  'assets/images/smallBanner${index + 1}.png',
                ),
              );
            },
          ),
        ),
        //banner
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Image.asset(
            banner2Image,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
