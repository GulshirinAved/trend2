import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_address_event.dart';
part 'select_address_state.dart';

class SelectAddressBloc extends Bloc<SelectAddressEvent, SelectAddressState> {
  SelectAddressBloc() : super(SelectAddressInitial(selectedIndex: -1)) {
    on<SelectAddressEvent>((event, emit) {
      emit(SelectAddressState(selectedIndex: event.selectedIndex));
    });
  }
}
