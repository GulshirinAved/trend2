import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_check_selection_event.dart';
part 'filter_check_selection_state.dart';

class FilterCheckSelectionBloc
    extends Bloc<FilterCheckSelectionEvent, FilterCheckSelectionState> {
  FilterCheckSelectionBloc()
      : super(
          const FilterCheckSelectionState(
            brandList: [],
            genderList: [],
            storeList: [],
            colorList: [],
            categoryList: [],
            sizeList: [],
            materialList: [],
            patternList: [],
            globalBrandList: [],
            globalCategoryList: [],
            globalStoreList: [],
            globalColorList: [],
            globalGenderList: [],
            globalMaterialList: [],
            globalPatternList: [],
            globalSizeList: [],
            isGlobal: false,
          ),
        ) {
    on<CheckEvent>((event, emit) {
      final List<String> updatedList = List<String>.from(
        state.getListForId(
          event.id,
          state.isGlobal,
        ),
      );
      if (!updatedList.contains(event.title)) {
        updatedList.add(event.title);
      }
      emit(
        state.copyWithListForId(
          event.id,
          updatedList,
          state.isGlobal,
        ),
      );
      print(state);
    });

    on<UncheckEvent>((event, emit) {
      final List<String> currentList = List<String>.from(
        state.getListForId(
          event.id,
          state.isGlobal,
        ),
      );
      currentList.remove(event.title);
      emit(
        state.copyWithListForId(
          event.id,
          currentList,
          state.isGlobal,
        ),
      );
      print(state);
    });

    on<ClearEvent>((event, emit) {
      emit(state.copyWithListForId(event.id, [], state.isGlobal));
    });

    on<ApplyEvent>((event, emit) {
      if (event.isGlobal) {
        emit(
          state.copyWith(
            globalBrandList: state.brandList,
            globalCategoryList: state.categoryList,
            globalStoreList: state.storeList,
            globalColorList: state.colorList,
            globalGenderList: state.genderList,
            globalMaterialList: state.materialList,
            globalPatternList: state.patternList,
            globalSizeList: state.sizeList,
            isGlobal: false,
          ),
        );
      } else {
// Apply changes locally
        emit(
          state.copyWith(
            globalBrandList: [],
            globalCategoryList: [],
            globalStoreList: [],
            globalColorList: [],
            globalGenderList: [],
            globalMaterialList: [],
            globalPatternList: [],
            globalSizeList: [],
            isGlobal: true,
          ),
        );
      }
      print(state);
    });
  }
}

extension on FilterCheckSelectionState {
  List<String> getListForId(int id, bool isGlobal) {
    switch (id) {
      case 0:
        return isGlobal ? globalBrandList : brandList;
      case 1:
        return isGlobal ? globalGenderList : genderList;
      case 2:
        return isGlobal ? globalStoreList : storeList;
      case 4:
        return isGlobal ? globalColorList : colorList;
      case 5:
        return isGlobal ? globalCategoryList : categoryList;
      case 6:
        return isGlobal ? globalSizeList : sizeList;
      case 7:
        return isGlobal ? globalMaterialList : materialList;
      case 8:
        return isGlobal ? globalPatternList : patternList;
      default:
        return [];
    }
  }

  FilterCheckSelectionState copyWithListForId(
    int id,
    List<String> updatedList,
    bool isGlobal,
  ) {
    switch (id) {
      case 0:
        return isGlobal
            ? copyWith(globalBrandList: updatedList)
            : copyWith(brandList: updatedList);
      case 1:
        return isGlobal
            ? copyWith(globalGenderList: updatedList)
            : copyWith(genderList: updatedList);
      case 2:
        return isGlobal
            ? copyWith(globalStoreList: updatedList)
            : copyWith(storeList: updatedList);
      case 4:
        return isGlobal
            ? copyWith(globalColorList: updatedList)
            : copyWith(colorList: updatedList);
      case 5:
        return isGlobal
            ? copyWith(globalCategoryList: updatedList)
            : copyWith(categoryList: updatedList);
      case 6:
        return isGlobal
            ? copyWith(globalSizeList: updatedList)
            : copyWith(sizeList: updatedList);
      case 7:
        return isGlobal
            ? copyWith(globalMaterialList: updatedList)
            : copyWith(materialList: updatedList);
      case 8:
        return isGlobal
            ? copyWith(globalPatternList: updatedList)
            : copyWith(patternList: updatedList);
      default:
        return this;
    }
  }
}
