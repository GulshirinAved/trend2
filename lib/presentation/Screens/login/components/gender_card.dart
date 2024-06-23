import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/blocs/signin_bloc/genderSelection_bloc/gender_selection_bloc.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class GenderCard extends StatelessWidget {
  final int index;
  final String title;
  final BorderRadius borderRadius;
  const GenderCard({
    required this.index,
    required this.title,
    required this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<GenderSelectionBloc>().add(GenderSelectionEvent(index));
      },
      child: BlocBuilder<GenderSelectionBloc, GenderSelectionState>(
        builder: (context, state) {
          return Container(
            width: 144.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: state.selectedIndex == index
                  ? AppColors.blueColor
                  : AppColors.grey6Color,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: state.selectedIndex == index
                    ? AppColors.whiteColor
                    : AppColors.grey5Color,
                fontWeight: FontWeight.w400,
                fontSize: AppFonts.font16,
              ),
            ),
          );
        },
      ),
    );
  }
}
