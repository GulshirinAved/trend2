import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_filter_event.dart';
part 'order_filter_state.dart';

class OrderFilterBloc extends Bloc<OrderFilterEvent, OrderFilterState> {
  OrderFilterBloc() : super(OrderFilterInitial(null)) {
    on<orderFilterPressedEvent>((event, emit) {
      emit(OrderFilterSelectionState(event.pressValue!));
    });
  }
}
