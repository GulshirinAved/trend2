// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'select_pay_method_bloc.dart';

class SelectPayMethodState extends Equatable {
  final String selectedPayment;
  const SelectPayMethodState({required this.selectedPayment});

  @override
  List<Object> get props => [selectedPayment];

  SelectPayMethodState copyWith({
    String? selectedPayment,
  }) {
    return SelectPayMethodState(
      selectedPayment: selectedPayment ?? this.selectedPayment,
    );
  }
}
