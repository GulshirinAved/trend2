// ignore_for_file: must_be_immutable

part of 'password_obscure_bloc.dart';

class PasswordObscureState extends Equatable {
  bool isObscure;
  bool isObscure1;
  bool isObscure2;
  bool isObscure3;
  bool isObscure4;

  PasswordObscureState({
    this.isObscure = false,
    this.isObscure1 = false,
    this.isObscure2 = false,
    this.isObscure3 = false,
    this.isObscure4 = false,
  });

  @override
  List<Object> get props =>
      [isObscure, isObscure1, isObscure2, isObscure3, isObscure4];

  PasswordObscureState copyWith({
    bool? isObscure,
    bool? isObscure1,
    bool? isObscure2,
    bool? isObscure3,
    bool? isObscure4,
  }) {
    return PasswordObscureState(
      isObscure: isObscure ?? this.isObscure,
      isObscure1: isObscure1 ?? this.isObscure1,
      isObscure2: isObscure2 ?? this.isObscure2,
      isObscure3: isObscure3 ?? this.isObscure3,
      isObscure4: isObscure4 ?? this.isObscure4,
    );
  }
}

final class PasswordObscureInitial extends PasswordObscureState {
  PasswordObscureInitial({required super.isObscure, required super.isObscure1});
}
