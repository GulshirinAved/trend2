part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  final List cartList;
  final int? sum;
  final int? sumDelivery;

  const CartState({required this.cartList, this.sum, this.sumDelivery});

  @override
  List<Object> get props => [cartList];
}

final class CartInitial extends CartState {
  const CartInitial({required super.cartList});
  @override
  List<Object> get props => [cartList];
}

final class CartSuccess extends CartState {
  const CartSuccess({required super.cartList});

  @override
  List<Object> get props => [cartList];
}

class SumProductState extends CartState {
  const SumProductState({
    required super.cartList,
    required this.sum,
    required this.sumDelivery,
  });

  final int sum;
  final int sumDelivery;

  @override
  List<Object> get props => [sum, sumDelivery];
}
