import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/blocs/store/bloc/banner_scrolling_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class ScrollingBanner extends StatefulWidget {
  const ScrollingBanner({
    super.key,
  });

  @override
  State<ScrollingBanner> createState() => _ScrollingBannerState();
}

class _ScrollingBannerState extends State<ScrollingBanner> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        //banner
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: SizedBox(
            height: 360.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: scrollingBanner.length,
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: (value) => context
                  .read<BannerScrollingBloc>()
                  .add(BannerScrollingEvent(value)),
              itemBuilder: (context, index) => Image.asset(
                scrollingBanner[index],
                height: 360.h,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //image number
        Positioned(
          bottom: 5.h,
          right: 5.w,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 5.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.darkGrey1Color,
              borderRadius: AppBorderRadius.borderRadius4,
            ),
            child: BlocBuilder<BannerScrollingBloc, BannerScrollingState>(
              builder: (context, state) {
                return Text(
                  '${(state.selectedIndex + 1).round()}/${scrollingBanner.length}',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    fontSize: AppFonts.font8,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
