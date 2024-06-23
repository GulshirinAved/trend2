// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'date_selection_dropdown_bloc.dart';

class DateSelectionDropdownState {
  final bool isMonthExpanded;
  final bool isYearExpanded;

  DateSelectionDropdownState({
    required this.isMonthExpanded,
    required this.isYearExpanded,
  });

  DateSelectionDropdownState copyWith({
    bool? isMonthExpanded,
    bool? isYearExpanded,
  }) {
    return DateSelectionDropdownState(
      isMonthExpanded: isMonthExpanded ?? this.isMonthExpanded,
      isYearExpanded: isYearExpanded ?? this.isYearExpanded,
    );
  }
}
