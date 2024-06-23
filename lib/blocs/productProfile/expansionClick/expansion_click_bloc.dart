import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'expansion_click_event.dart';
part 'expansion_click_state.dart';

class ExpansionClickBloc
    extends Bloc<ExpansionClickEvent, ExpansionClickState> {
  ExpansionClickBloc() : super(ExpansionClickState(false)) {
    on<ExpansionClickEvent>((event, emit) {
      emit(
        state.copyWith(
          isExpanded: !state.isExpanded,
        ),
      );
    });
  }
}
