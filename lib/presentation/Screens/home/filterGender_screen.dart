// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_marketplace2/blocs/allProducts/filterCheckSelection/filter_check_selection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
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
            // Simplified condition using a helper function
            _isClearButtonEnabled(state, id)
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
                final filterTitle = filterNameList[id]['subCategory'][index];
                final isChecked = state.isFilterChecked(
                  id,
                  filterTitle,
                  state.isGlobal,
                );

                return CustomCheckbox(
                  checkBox: isChecked,
                  onTap: (value) {
                    if (value!) {
                      context.read<FilterCheckSelectionBloc>().add(
                            CheckEvent(filterTitle, id),
                          );
                    } else {
                      context.read<FilterCheckSelectionBloc>().add(
                            UncheckEvent(filterTitle, id),
                          );
                    }
                  },
                  title: filterTitle,
                );
              },
            ),
          ),
          bottomSheet:
              BlocBuilder<FilterCheckSelectionBloc, FilterCheckSelectionState>(
            builder: (context, state) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                child: Button(
                  onTap: () {
                    context
                        .read<FilterCheckSelectionBloc>()
                        .add(const ApplyEvent(isGlobal: true));
                    Navigator.pop(context);
                  },
                  width: 150,
                  title: 'Apply',
                  textSize: AppFonts.font12,
                ),
              );
            },
          ),
        );
      },
    );
  }

  // Helper function to check if the "Clear" button should be enabled
  bool _isClearButtonEnabled(FilterCheckSelectionState state, int id) {
    switch (id) {
      case 0:
        return state.isGlobal == false
            ? state.brandList.isNotEmpty
            : state.globalBrandList.isEmpty;
      case 1:
        return state.isGlobal == false
            ? state.genderList.isNotEmpty
            : state.globalGenderList.isEmpty;
      case 2:
        return state.isGlobal == false
            ? state.storeList.isNotEmpty
            : state.globalStoreList.isNotEmpty;
      case 4:
        return state.isGlobal == false
            ? state.colorList.isNotEmpty
            : state.globalColorList.isEmpty;
      case 5:
        return state.isGlobal == false
            ? state.categoryList.isNotEmpty
            : state.globalCategoryList.isNotEmpty;
      case 6:
        return state.isGlobal == false
            ? state.sizeList.isNotEmpty
            : state.globalSizeList.isNotEmpty;
      case 7:
        return state.isGlobal == false
            ? state.materialList.isNotEmpty
            : state.globalMaterialList.isNotEmpty;
      case 8:
        return state.isGlobal == false
            ? state.patternList.isNotEmpty
            : state.globalPatternList.isNotEmpty;
      default:
        return false;
    }
  }
}

// Extension method on FilterCheckSelectionState for better readability
extension FilterCheckState on FilterCheckSelectionState {
  bool isFilterChecked(int id, String filterTitle, bool isGlobal) {
    switch (id) {
      case 0:
        return isGlobal
            ? globalBrandList.contains(filterTitle)
            : brandList.contains(filterTitle);
      case 1:
        return isGlobal
            ? globalGenderList.contains(filterTitle)
            : genderList.contains(filterTitle);
      case 2:
        return isGlobal
            ? globalStoreList.contains(filterTitle)
            : storeList.contains(filterTitle);
      case 4:
        return isGlobal
            ? globalColorList.contains(filterTitle)
            : colorList.contains(filterTitle);
      case 5:
        return isGlobal
            ? globalCategoryList.contains(filterTitle)
            : categoryList.contains(filterTitle);
      case 6:
        return isGlobal
            ? globalSizeList.contains(filterTitle)
            : sizeList.contains(filterTitle);
      case 7:
        return isGlobal
            ? globalMaterialList.contains(filterTitle)
            : materialList.contains(filterTitle);
      case 8:
        return isGlobal
            ? globalPatternList.contains(filterTitle)
            : patternList.contains(filterTitle);
      default:
        return false;
    }
  }
}
