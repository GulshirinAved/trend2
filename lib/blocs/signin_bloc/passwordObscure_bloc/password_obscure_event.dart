part of 'password_obscure_bloc.dart';

sealed class PasswordObscureEvent extends Equatable {
  const PasswordObscureEvent();

  @override
  List<Object> get props => [];
}

class PasswordEvent extends PasswordObscureEvent {
  const PasswordEvent();
}

class PasswordConfirmEvent extends PasswordObscureEvent {
  const PasswordConfirmEvent();
}

class PasswordCurrentEvent extends PasswordObscureEvent {
  const PasswordCurrentEvent();
}

class PasswordNewEvent extends PasswordObscureEvent {
  const PasswordNewEvent();
}

class PasswordConfirm1Event extends PasswordObscureEvent {
  const PasswordConfirm1Event();
}
