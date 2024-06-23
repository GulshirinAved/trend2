import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'card_selection_event.dart';
part 'card_selection_state.dart';

class CardSelectionBloc extends Bloc<CardSelectionEvent, CardSelectionState> {
  CardSelectionBloc() : super(const CardSelectionState(-1)) {
    on<CardSelectionEvent>((event, emit) {
      emit(state.copyWith(selectiedIndex: event.pressedIndex));
    });
  }
}
