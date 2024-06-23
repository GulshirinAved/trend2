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
              isGlobal: false),
        ) {
    on<CheckEvent>((event, emit) {
// Create a new list from the current state list
      final List<String> updatedList =
          List<String>.from(state.getListForId(event.id));
// Add the title if it's not already in the list
      if (!updatedList.contains(event.title)) {
        updatedList.add(event.title);
      }
// Emit the new state with the updated list
      emit(state.copyWithListForId(event.id, updatedList));
    });

    on<UncheckEvent>((event, emit) {
// Get the current list based on the event id
      final List<String> currentList =
          List<String>.from(state.getListForId(event.id));
// Remove the title from the list
      currentList.remove(event.title);
// Emit the new state with the updated list
      emit(state.copyWithListForId(event.id, currentList));
    });

    on<ClearEvent>((event, emit) {
// Emit the new state with an empty list for the given id
      emit(state.copyWithListForId(event.id, []));
    });
    on<ApplyEvent>((event, emit) {});
  }
}

extension on FilterCheckSelectionState {
  List<String> getListForId(int id) {
// Return the list corresponding to the id
    switch (id) {
      case 0:
        return brandList;
      case 1:
        return genderList;
      case 2:
        return storeList;
      case 4:
        return colorList;
      case 5:
        return categoryList;
      case 6:
        return sizeList;
      case 7:
        return materialList;
      case 8:
        return patternList;
      default:
        return [];
    }
  }

  FilterCheckSelectionState copyWithListForId(
    int id,
    List<String> updatedList,
  ) {
// Return a new state with the updated list for the given id
    switch (id) {
      case 0:
        return copyWith(brandList: updatedList);
      case 1:
        return copyWith(genderList: updatedList);
      case 2:
        return copyWith(storeList: updatedList);
      case 4:
        return copyWith(colorList: updatedList);
      case 5:
        return copyWith(categoryList: updatedList);
      case 6:
        return copyWith(sizeList: updatedList);
      case 7:
        return copyWith(materialList: updatedList);
      case 8:
        return copyWith(patternList: updatedList);
      default:
        return this;
    }
  }
}
