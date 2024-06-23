part of 'date_selection_dropdown_bloc.dart';

sealed class DateSelectionDropdownEvent extends Equatable {
  const DateSelectionDropdownEvent();

  @override
  List<Object> get props => [];
}

class MonthSelectionEvent extends DateSelectionDropdownEvent {}

class YearSelectionEvent extends DateSelectionDropdownEvent {}
