part of 'category_selection_bloc.dart';

// ignore: must_be_immutable
class CategorySelectionState extends Equatable {
  int stateIndex;

  CategorySelectionState({this.stateIndex = 0});

  @override
  List<Object?> get props => [stateIndex];

  CategorySelectionState copyWith({
    int? stateIndex,
  }) {
    return CategorySelectionState(
      stateIndex: stateIndex ?? this.stateIndex,
    );
  }
}
