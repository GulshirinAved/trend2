// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'size_selection_bloc.dart';

class SizeSelectionEvent extends Equatable {
  final int pressedIndex;
  const SizeSelectionEvent(
    this.pressedIndex,
  );

  @override
  List<Object> get props => [pressedIndex];
}
