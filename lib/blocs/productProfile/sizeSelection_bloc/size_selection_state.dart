// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'size_selection_bloc.dart';

class SizeSelectionState extends Equatable {
  final int selectedIndex;
  const SizeSelectionState(
    this.selectedIndex,
  );

  @override
  List<Object> get props => [selectedIndex];

  SizeSelectionState copyWith({
    int? selectedIndex,
  }) {
    return SizeSelectionState(
      selectedIndex ?? this.selectedIndex,
    );
  }
}
