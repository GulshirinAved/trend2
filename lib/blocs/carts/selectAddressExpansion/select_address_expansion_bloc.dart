import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_address_expansion_event.dart';
part 'select_address_expansion_state.dart';

class SelectAddressExpansionBloc
    extends Bloc<SelectAddressExpansionEvent, SelectAddressExpansionState> {
  SelectAddressExpansionBloc()
      : super(const SelectAddressExpansionState(isExpanded: false)) {
    on<SelectAddressExpansionEvent>((event, emit) {
      emit(state.copyWith(isExpanded: !state.isExpanded));
    });
  }
}
