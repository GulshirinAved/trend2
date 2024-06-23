import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_user_info_event.dart';
part 'check_user_info_state.dart';

class CheckUserInfoBloc extends Bloc<CheckUserInfoEvent, CheckUserInfoState> {
  CheckUserInfoBloc() : super(CheckUserInfoState(false)) {
    on<CheckUserInfoEvent>((event, emit) {
      emit(state.copyWith(isChecked: !state.isChecked));
    });
  }
}
