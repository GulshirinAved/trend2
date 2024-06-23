import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_switcher_event.dart';
part 'filter_switcher_state.dart';

class FilterSwitcherBloc
    extends Bloc<FilterSwitcherEvent, FilterSwitcherState> {
  FilterSwitcherBloc() : super(const FilterSwitcherState([])) {
    on<FilterSwitchOn>((event, emit) {
      List<int> updatedList = List.from(state.switcherList);
      if (!updatedList.contains(event.switchedIndex)) {
        updatedList.add(event.switchedIndex);
      }
      emit(state.copyWith(switcherList: updatedList));
    });
    on<FilterSwitchOff>((event, emit) {
      List updatedList = List.from(state.switcherList);
      updatedList.remove(event.switchedIndex);
      emit(state.copyWith(switcherList: updatedList));
    });
  }
}
