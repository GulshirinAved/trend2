// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'check_out_selection_bloc.dart';

class CheckOutSelectionEvent extends Equatable {
  final int pressIndex;
  const CheckOutSelectionEvent({
    required this.pressIndex,
  });

  @override
  List<Object> get props => [pressIndex];
}
