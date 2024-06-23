// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sort_bloc.dart';

class SortEvent extends Equatable {
  final String pressedTitle;

  const SortEvent({
    required this.pressedTitle,
  });

  @override
  List<Object> get props => [pressedTitle];
}
