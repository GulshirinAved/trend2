// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trend_marketplace2/blocs/allProducts/filterCheckSelection/filter_check_selection_bloc.dart';
import 'package:trend_marketplace2/blocs/allProducts/sort/sort_bloc.dart';
import 'package:trend_marketplace2/blocs/productProfile/cardSelection/card_selection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_checkBox.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_radioButton.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_textfield.dart';

class FilterTopModal extends StatelessWidget {
  final String topCardTitle;
  const FilterTopModal({
    required this.topCardTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: const Border(bottom: BorderSide(color: Colors.transparent)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //custom textField
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            child: CustomTextField(title: 'T shirts (156 prosucts)'),
          ),
          topCardTitle == 'Sort'
              ? Column(
                  children:
                      filterSortList[0]['subCategory'].map<Widget>((filter) {
                    return BlocBuilder<SortBloc, SortState>(
                      builder: (context, state) {
                        return CustomRadioButton(
                          title: filter,
                          value: filter,
                          groupValue: state.title,
                          onChanged: (value) {
                            context.read<SortBloc>().add(
                                  SortEvent(
                                    pressedTitle: value.toString(),
                                  ),
                                );
                          },
                        );
                      },
                    );
                  }).toList(),
                )
              :
              //check boxes
              BlocBuilder<CardSelectionBloc, CardSelectionState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      child: Scrollbar(
                        controller: scrollController,
                        interactive: true,
                        scrollbarOrientation: ScrollbarOrientation.right,
                        radius: const Radius.circular(20),
                        thickness: 7,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: filterSortList[state.selectiedIndex]
                                  ['subCategory']
                              .length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return BlocBuilder<FilterCheckSelectionBloc,
                                FilterCheckSelectionState>(
                              builder: (context, stateFilter) {
                                final currentFilterItem =
                                    filterSortList[state.selectiedIndex]
                                        ['subCategory'][index];
                                final filterId =
                                    _getFilterIdForIndex(state.selectiedIndex);
                                return CustomCheckbox(
                                  checkBox: _isFilterChecked(
                                    stateFilter,
                                    filterId,
                                    currentFilterItem,
                                    stateFilter.isGlobal,
                                  ),
                                  onTap: (value) {
                                    if (value!) {
                                      context
                                          .read<FilterCheckSelectionBloc>()
                                          .add(
                                            CheckEvent(
                                              currentFilterItem,
                                              filterId,
                                            ),
                                          );
                                    } else {
                                      context
                                          .read<FilterCheckSelectionBloc>()
                                          .add(
                                            UncheckEvent(
                                              currentFilterItem,
                                              filterId,
                                            ),
                                          );
                                    }
                                  },
                                  title: currentFilterItem,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
          Divider(
            color: AppColors.grey14Color,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(
                onTap: () {
                  context
                      .read<CardSelectionBloc>()
                      .add(const CardSelectionEvent(-1));
                  context
                      .read<FilterCheckSelectionBloc>()
                      .add(const CancelEvent());
                },
                width: 150,
                title: 'Close',
                backColor: AppColors.whiteColor,
                borderColor: AppColors.darkGrey2Color,
                textColor: AppColors.darkGrey2Color,
                textSize: AppFonts.font12,
              ),
              BlocBuilder<FilterCheckSelectionBloc, FilterCheckSelectionState>(
                builder: (context, state) {
                  return Button(
                    onTap: () {
                      context
                          .read<CardSelectionBloc>()
                          .add(const CardSelectionEvent(-1));
                      context
                          .read<FilterCheckSelectionBloc>()
                          .add(const ApplyEvent(isGlobal: true));
                      Navigator.pop(context);
                    },
                    width: 150,
                    title: 'Apply',
                    textSize: AppFonts.font12,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  int _getFilterIdForIndex(int index) {
    switch (index) {
      case 2:
        return 5; // Category
      case 3:
        return 0; // Brand
      case 4:
        return 2; // Seller
      default:
        return -1; // Handle other cases appropriately
    }
  }
}

bool _isFilterChecked(
  FilterCheckSelectionState stateFilter,
  int selectedIndex,
  String filterItem,
  bool? isGlobal,
) {
  switch (selectedIndex) {
    case 5:
      return isGlobal == false
          ? stateFilter.categoryList.contains(filterItem)
          : stateFilter.globalCategoryList.contains(filterItem);

    case 0:
      return isGlobal == false
          ? stateFilter.brandList.contains(filterItem)
          : stateFilter.globalBrandList.contains(filterItem);
    case 2:
      return isGlobal == false
          ? stateFilter.storeList.contains(filterItem)
          : stateFilter.globalStoreList.contains(filterItem);
    default:
      return false;
  }
}
