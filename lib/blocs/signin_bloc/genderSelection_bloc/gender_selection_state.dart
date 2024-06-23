// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'gender_selection_bloc.dart';

class GenderSelectionState extends Equatable {
  final int selectedIndex;
  const GenderSelectionState(
    this.selectedIndex,
  );

  @override
  List<Object> get props => [selectedIndex];

  GenderSelectionState copyWith({
    int? selectedIndex,
  }) {
    return GenderSelectionState(
      selectedIndex ?? this.selectedIndex,
    );
  }
}
