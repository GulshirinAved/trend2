import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_obscure_event.dart';
part 'password_obscure_state.dart';

class PasswordObscureBloc
    extends Bloc<PasswordObscureEvent, PasswordObscureState> {
  PasswordObscureBloc()
      : super(PasswordObscureInitial(isObscure: false, isObscure1: false)) {
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(isObscure: !state.isObscure));
    });
    on<PasswordConfirmEvent>((event, emit) {
      emit(state.copyWith(isObscure1: !state.isObscure1));
    });
    on<PasswordCurrentEvent>((event, emit) {
      emit(state.copyWith(isObscure2: !state.isObscure2));
    });
    on<PasswordNewEvent>((event, emit) {
      emit(state.copyWith(isObscure3: !state.isObscure3));
    });
    on<PasswordConfirm1Event>((event, emit) {
      emit(state.copyWith(isObscure4: !state.isObscure4));
    });
  }
}
