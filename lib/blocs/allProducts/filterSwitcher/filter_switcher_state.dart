// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_switcher_bloc.dart';

class FilterSwitcherState extends Equatable {
  final List switcherList;
  const FilterSwitcherState(this.switcherList);

  @override
  List<Object> get props => [switcherList];

  FilterSwitcherState copyWith({
    List? switcherList,
  }) {
    return FilterSwitcherState(
      switcherList ?? this.switcherList,
    );
  }
}
