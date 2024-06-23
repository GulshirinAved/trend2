part of 'image_scrolling_bloc.dart';

class ImageScrollingEvent extends Equatable {
  final int pressedIndex;
  const ImageScrollingEvent(this.pressedIndex);

  @override
  List<Object> get props => [pressedIndex];
}
