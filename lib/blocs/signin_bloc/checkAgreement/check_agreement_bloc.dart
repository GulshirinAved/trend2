import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';

part 'check_agreement_event.dart';
part 'check_agreement_state.dart';

class CheckAgreementBloc
    extends Bloc<CheckAgreementEvent, CheckAgreementState> {
  CheckAgreementBloc()
      : super(
          CheckAgreementState(
            checkList: List.generate(signInAgreement.length, (index) => false),
          ),
        ) {
    on<CheckAgreementEvent>((event, emit) {
      final updatedList = List<bool>.from(state.checkList);
      updatedList[event.index] = !updatedList[event.index];
      emit(CheckAgreementState(checkList: updatedList));
    });
  }
}
