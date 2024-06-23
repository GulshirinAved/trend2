part of 'sort_bloc.dart';

class SortState extends Equatable {
  final String title;

  const SortState({required this.title});

  @override
  List<Object> get props => [title];
  SortState copyWith({String? title}) {
    return SortState(title: title ?? this.title);
  }
}
