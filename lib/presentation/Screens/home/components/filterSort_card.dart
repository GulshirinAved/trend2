import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/blocs/productProfile/cardSelection/card_selection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class FilterSortCard extends StatelessWidget {
  const FilterSortCard({
    required this.index,
    required this.filterAndSort,
    required this.onTap,
    super.key,
  });
  final int index;
  final List<Map<String, dynamic>>? filterAndSort;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BlocBuilder<CardSelectionBloc, CardSelectionState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(
                color: filterAndSort![index]['title'] == 'Filters' ||
                        state.selectiedIndex == index
                    ? AppColors.blueColor
                    : AppColors.grey4Color,
              ),
              borderRadius: AppBorderRadius.borderRadius12,
            ),
            child: Row(
              children: [
                filterAndSort![index]['icon'] == null
                    ? const SizedBox.shrink()
                    : SvgPicture.asset(
                        filterAndSort![index]['icon'],
                        colorFilter: ColorFilter.mode(
                          filterAndSort![index]['title'] == 'Filters'
                              ? AppColors.blueColor
                              : AppColors.darkGrey3Color,
                          BlendMode.srcIn,
                        ),
                      ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  filterAndSort![index]['title'],
                  style: TextStyle(
                    color: filterAndSort![index]['title'] == 'Filters'
                        ? AppColors.blueColor
                        : AppColors.darkGrey1Color,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFonts.font12,
                  ),
                ),
                filterAndSort![index]['icon'] == null
                    ? Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: SvgPicture.asset(
                          state.selectiedIndex == index
                              ? arrowUpIcon
                              : arrowDownIcon,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
