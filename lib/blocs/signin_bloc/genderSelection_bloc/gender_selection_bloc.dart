import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gender_selection_event.dart';
part 'gender_selection_state.dart';

class GenderSelectionBloc
    extends Bloc<GenderSelectionEvent, GenderSelectionState> {
  GenderSelectionBloc() : super(const GenderSelectionState(0)) {
    on<GenderSelectionEvent>((event, emit) {
      emit(state.copyWith(selectedIndex: event.selectedIndex));
    });
  }
}
