part of 'check_user_info_bloc.dart';

class CheckUserInfoEvent extends Equatable {
  final bool pressCheck;
  const CheckUserInfoEvent(this.pressCheck);

  @override
  List<Object> get props => [pressCheck];
}
