import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'banner_scrolling_event.dart';
part 'banner_scrolling_state.dart';

class BannerScrollingBloc
    extends Bloc<BannerScrollingEvent, BannerScrollingState> {
  BannerScrollingBloc() : super(BannerScrollingState(0)) {
    on<BannerScrollingEvent>((event, emit) {
      emit(state.copyWith(selectedIndex: event.pressedIndex));
    });
  }
}
