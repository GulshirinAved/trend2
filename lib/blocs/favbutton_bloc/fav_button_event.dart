part of 'fav_button_bloc.dart';

sealed class FavButtonEvent extends Equatable {
  FavItem item;

  FavButtonEvent({required this.item});

  @override
  List<Object> get props => [item];
}

class ToggleFavEvent extends FavButtonEvent {
  ToggleFavEvent({required super.item});
}
