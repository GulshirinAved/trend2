import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'size_selection_event.dart';
part 'size_selection_state.dart';

class SizeSelectionBloc extends Bloc<SizeSelectionEvent, SizeSelectionState> {
  SizeSelectionBloc() : super(SizeSelectionState(-1)) {
    on<SizeSelectionEvent>((event, emit) {
      emit(state.copyWith(selectedIndex: event.pressedIndex));
    });
  }
}
