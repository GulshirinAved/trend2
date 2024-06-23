// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_switcher_bloc.dart';

sealed class FilterSwitcherEvent extends Equatable {
  final int switchedIndex;
  const FilterSwitcherEvent(this.switchedIndex);

  @override
  List<Object> get props => [switchedIndex];
}

class FilterSwitchOn extends FilterSwitcherEvent {
  const FilterSwitchOn(super.switchedIndex);
  @override
  List<Object> get props => [switchedIndex];
}

class FilterSwitchOff extends FilterSwitcherEvent {
  const FilterSwitchOff(super.isSwitched);
  @override
  List<Object> get props => [switchedIndex];
}
