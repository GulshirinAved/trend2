part of 'card_selection_bloc.dart';

class CardSelectionEvent extends Equatable {
  final int pressedIndex;
  const CardSelectionEvent(this.pressedIndex);

  @override
  List<Object> get props => [pressedIndex];
}
