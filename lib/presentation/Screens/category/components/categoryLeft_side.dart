import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/blocs/category/categorySelection/category_selection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class CategoryLeftSide extends StatefulWidget {
  final PageController pageController;

  const CategoryLeftSide({
    required this.pageController,
    super.key,
  });

  @override
  State<CategoryLeftSide> createState() => _CategoryLeftSideState();
}

class _CategoryLeftSideState extends State<CategoryLeftSide> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      child: ListView.builder(
        itemCount: categoryTypes.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context
                  .read<CategorySelectionBloc>()
                  .add(PressBoxEvent(index: index));
              if (_scrollController.hasClients) {
                widget.pageController.jumpToPage(index);
              }
            },
            child: BlocBuilder<CategorySelectionBloc, CategorySelectionState>(
              builder: (context, state) {
                return Container(
                  decoration: BoxDecoration(
                    color: state.stateIndex == index
                        ? AppColors.whiteColor
                        : AppColors.lightGreyColor,
                  ),
                  padding: EdgeInsets.only(
                    left: 16.w,
                    top: 12.h,
                    right: 5.w,
                    bottom: 12.h,
                  ),
                  child: Text(
                    maxLines: 2,
                    categoryTypes[index]['title'],
                    style: TextStyle(
                      color: state.stateIndex == index
                          ? AppColors.blueColor
                          : AppColors.grey2Color,
                      fontSize: AppFonts.font12,
                      fontWeight: state.stateIndex == index
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
