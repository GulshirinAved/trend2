// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'check_agreement_bloc.dart';

class CheckAgreementState extends Equatable {
  final List checkList;

  const CheckAgreementState({required this.checkList});

  @override
  List<Object> get props => [checkList];

  CheckAgreementState copyWith({
    List? checkList,
  }) {
    return CheckAgreementState(
      checkList: checkList ?? this.checkList,
    );
  }
}
