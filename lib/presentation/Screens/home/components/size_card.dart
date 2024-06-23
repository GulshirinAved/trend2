import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_marketplace2/blocs/productProfile/sizeSelection_bloc/size_selection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class SizeCard extends StatelessWidget {
  final int index;
  const SizeCard({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SizeSelectionBloc>().add(SizeSelectionEvent(index));
      },
      child: BlocBuilder<SizeSelectionBloc, SizeSelectionState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: state.selectedIndex == index
                  ? AppColors.blueColor.withOpacity(0.1)
                  : AppColors.whiteColor,
              borderRadius: AppBorderRadius.borderRadius4,
              border: Border.all(
                color: state.selectedIndex == index
                    ? AppColors.blueColor
                    : AppColors.grey12Color,
                width: 1,
              ),
            ),
            child: Text(
              sizeList[index],
              style: TextStyle(
                color: state.selectedIndex == index
                    ? AppColors.blueColor
                    : AppColors.grey11Color,
                fontSize: AppFonts.font10,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}
