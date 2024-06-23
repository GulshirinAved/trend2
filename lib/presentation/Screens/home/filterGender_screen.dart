// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_marketplace2/blocs/allProducts/filterCheckSelection/filter_check_selection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_checkBox.dart';

class FilterGenderScreen extends StatelessWidget {
  final String topTitle;
  final int id;
  const FilterGenderScreen({
    required this.topTitle,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCheckSelectionBloc, FilterCheckSelectionState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar.normal(
            topTitle,
            'Clear',
            () {
              context.read<FilterCheckSelectionBloc>().add(ClearEvent(id: id));
            },
            id == 0 && state.brandList.isNotEmpty ||
                    id == 1 && state.genderList.isNotEmpty ||
                    id == 2 && state.storeList.isNotEmpty ||
                    id == 4 && state.colorList.isNotEmpty ||
                    id == 5 && state.categoryList.isNotEmpty ||
                    id == 6 && state.sizeList.isNotEmpty ||
                    id == 7 && state.materialList.isNotEmpty ||
                    id == 8 && state.patternList.isNotEmpty
                ? AppColors.blueColor
                : AppColors.darkGrey2Color,
          ),
          body: Container(
            color: AppColors.whiteColor,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: filterNameList[id]['subCategory'].length,
              itemBuilder: (context, index) {
                return CustomCheckbox(
                  checkBox: id == 0
                      ? state.brandList
                          .contains(filterNameList[id]['subCategory'][index])
                      : id == 1
                          ? state.genderList.contains(
                              filterNameList[id]['subCategory'][index],
                            )
                          : id == 2
                              ? state.storeList.contains(
                                  filterNameList[id]['subCategory'][index])
                              : id == 4
                                  ? state.colorList.contains(
                                      filterNameList[id]['subCategory'][index],
                                    )
                                  : id == 5
                                      ? state.categoryList.contains(
                                          filterNameList[5]['subCategory']
                                              [index])
                                      : id == 6
                                          ? state.sizeList.contains(
                                              filterNameList[id]['subCategory']
                                                  [index],
                                            )
                                          : id == 7
                                              ? state.materialList.contains(
                                                  filterNameList[id]
                                                      ['subCategory'][index])
                                              : state.materialList.contains(
                                                  filterNameList[id]
                                                      ['subCategory'][index]),
                  onTap: (value) {
                    if (value!) {
                      context.read<FilterCheckSelectionBloc>().add(
                            CheckEvent(
                              filterNameList[id]['subCategory'][index],
                              id,
                            ),
                          );
                    } else {
                      context.read<FilterCheckSelectionBloc>().add(
                            UncheckEvent(
                              filterNameList[id]['subCategory'][index],
                              id,
                            ),
                          );
                    }
                  },
                  title: filterNameList[id]['subCategory'][index],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
