// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_check_selection_bloc.dart';

abstract class FilterCheckSelectionEvent extends Equatable {
  const FilterCheckSelectionEvent();

  @override
  List<Object> get props => [];
}

class CheckEvent extends FilterCheckSelectionEvent {
  final String title;
  final int id;

  const CheckEvent(
    this.title,
    this.id,
  );

  @override
  List<Object> get props => [
        title,
        id,
      ];
}

class UncheckEvent extends FilterCheckSelectionEvent {
  final String title;
  final int id;

  const UncheckEvent(
    this.title,
    this.id,
  );

  @override
  List<Object> get props => [
        title,
        id,
      ];
}

class ClearEvent extends FilterCheckSelectionEvent {
  final int id;

  const ClearEvent({
    required this.id,
  });
}

class CancelEvent extends FilterCheckSelectionEvent {
  const CancelEvent();
}

class ApplyEvent extends FilterCheckSelectionEvent {
  const ApplyEvent();
}
