// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'expansion_click_bloc.dart';

class ExpansionClickState extends Equatable {
  final bool isExpanded;
  const ExpansionClickState(this.isExpanded);

  @override
  List<Object> get props => [isExpanded];

  ExpansionClickState copyWith({
    bool? isExpanded,
  }) {
    return ExpansionClickState(
      isExpanded ?? this.isExpanded,
    );
  }
}
