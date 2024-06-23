part of 'select_pay_method_bloc.dart';

class SelectPayMethodEvent extends Equatable {
  final String pressedValue;
  const SelectPayMethodEvent({required this.pressedValue});

  @override
  List<Object> get props => [pressedValue];
}
