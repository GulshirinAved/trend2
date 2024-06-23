part of 'order_filter_bloc.dart';

sealed class OrderFilterEvent extends Equatable {
  const OrderFilterEvent();

  @override
  List<Object> get props => [];
}

final class orderFilterPressedEvent extends OrderFilterEvent {
  final String? pressValue;

  orderFilterPressedEvent({required this.pressValue});
  @override
  List<Object> get props => [pressValue!];
}
