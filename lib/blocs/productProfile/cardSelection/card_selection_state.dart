// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'card_selection_bloc.dart';

class CardSelectionState extends Equatable {
  final int selectiedIndex;
  const CardSelectionState(
    this.selectiedIndex,
  );

  @override
  List<Object> get props => [selectiedIndex];

  CardSelectionState copyWith({
    int? selectiedIndex,
  }) {
    return CardSelectionState(
      selectiedIndex ?? this.selectiedIndex,
    );
  }
}
