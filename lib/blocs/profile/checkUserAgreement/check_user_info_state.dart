// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'check_user_info_bloc.dart';

class CheckUserInfoState extends Equatable {
  final bool isChecked;
  const CheckUserInfoState(this.isChecked);

  @override
  List<Object> get props => [isChecked];

  CheckUserInfoState copyWith({
    bool? isChecked,
  }) {
    return CheckUserInfoState(
      isChecked ?? this.isChecked,
    );
  }
}
