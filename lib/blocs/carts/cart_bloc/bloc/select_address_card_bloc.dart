import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_address_card_event.dart';
part 'select_address_card_state.dart';

class SelectAddressCardBloc extends Bloc<SelectAddressCardEvent, SelectAddressCardState> {
  SelectAddressCardBloc() : super(SelectAddressCardInitial()) {
    on<SelectAddressCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
