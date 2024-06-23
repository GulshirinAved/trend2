part of 'order_filter_bloc.dart';

sealed class OrderFilterState extends Equatable {
  final String? selectedValue;

  const OrderFilterState(this.selectedValue);
  @override
  List<Object> get props => [selectedValue!];
}

final class OrderFilterInitial extends OrderFilterState {
  const OrderFilterInitial(super.selectedValue);
}

final class OrderFilterSelectionState extends OrderFilterState {
  const OrderFilterSelectionState(super.selectedValue);
}
