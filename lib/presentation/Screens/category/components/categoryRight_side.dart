import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class CategoryRightSide extends StatelessWidget {
  final int selectedIndex;
  const CategoryRightSide({
    required this.selectedIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: AppColors.whiteColor,
        padding: const EdgeInsets.all(5),
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: categoryTypes[selectedIndex]['images'].length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: MediaQuery.of(context).size.height * 0.17,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.grey3Color,
                        width: 1,
                      ),
                    ),
                    child: Image.asset(
                      categoryTypes[selectedIndex]['images'][index]['image'],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      categoryTypes[selectedIndex]['images'][index]['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.grey2Color,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFonts.font10,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
