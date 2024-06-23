import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_out_selection_event.dart';
part 'check_out_selection_state.dart';

class CheckOutSelectionBloc
    extends Bloc<CheckOutSelectionEvent, CheckOutSelectionState> {
  CheckOutSelectionBloc()
      : super(const CheckOutSelectionState(selectedIndex: 0)) {
    on<CheckOutSelectionEvent>((event, emit) {
      emit(state.copyWith(selectedIndex: event.pressIndex));
    });
  }
}
