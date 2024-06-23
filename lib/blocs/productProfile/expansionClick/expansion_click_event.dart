// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'expansion_click_bloc.dart';

class ExpansionClickEvent extends Equatable {
  final bool isExpandedClicked;
  const ExpansionClickEvent(
    this.isExpandedClicked,
  );

  @override
  List<Object> get props => [isExpandedClicked];
}
