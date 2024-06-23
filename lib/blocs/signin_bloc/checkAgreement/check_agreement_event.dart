part of 'check_agreement_bloc.dart';

class CheckAgreementEvent extends Equatable {
  final int index;
  const CheckAgreementEvent(this.index);

  @override
  List<Object> get props => [false, index];
}
