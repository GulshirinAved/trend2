// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'check_out_selection_bloc.dart';

class CheckOutSelectionState extends Equatable {
  final int selectedIndex;
  const CheckOutSelectionState({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];

  CheckOutSelectionState copyWith({
    int? selectedIndex,
  }) {
    return CheckOutSelectionState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
