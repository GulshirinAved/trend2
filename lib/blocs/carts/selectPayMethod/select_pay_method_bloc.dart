import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_pay_method_event.dart';
part 'select_pay_method_state.dart';

class SelectPayMethodBloc
    extends Bloc<SelectPayMethodEvent, SelectPayMethodState> {
  SelectPayMethodBloc()
      : super(const SelectPayMethodState(selectedPayment: '')) {
    on<SelectPayMethodEvent>((event, emit) {
      emit(state.copyWith(selectedPayment: event.pressedValue));
    });
  }
}
