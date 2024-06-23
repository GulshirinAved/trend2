part of 'gender_selection_bloc.dart';

class GenderSelectionEvent extends Equatable {
  final int selectedIndex;

  const GenderSelectionEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
