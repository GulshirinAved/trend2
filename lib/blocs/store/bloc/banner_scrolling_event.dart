part of 'banner_scrolling_bloc.dart';

class BannerScrollingEvent extends Equatable {
  final int pressedIndex;

  const BannerScrollingEvent(this.pressedIndex);

  @override
  List<Object> get props => [pressedIndex];
}
