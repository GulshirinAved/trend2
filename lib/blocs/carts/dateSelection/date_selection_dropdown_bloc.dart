import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'date_selection_dropdown_event.dart';
part 'date_selection_dropdown_state.dart';

class DateSelectionDropdownBloc
    extends Bloc<DateSelectionDropdownEvent, DateSelectionDropdownState> {
  DateSelectionDropdownBloc()
      : super(DateSelectionDropdownState(
            isMonthExpanded: false, isYearExpanded: false)) {
    on<MonthSelectionEvent>((event, emit) {
      emit(state.copyWith(isMonthExpanded: !state.isMonthExpanded));
    });
    on<YearSelectionEvent>((event, emit) {
      emit(state.copyWith(isYearExpanded: !state.isYearExpanded));
    });
  }
}
