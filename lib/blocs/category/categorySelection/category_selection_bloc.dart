import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_selection_event.dart';
part 'category_selection_state.dart';

class CategorySelectionBloc
    extends Bloc<CategorySelectionEvent, CategorySelectionState> {
  CategorySelectionBloc() : super(CategorySelectionState()) {
    on<PressBoxEvent>((event, emit) {
      emit(state.copyWith(stateIndex: event.index));
    });
  }
}
