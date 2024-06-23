import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial(cartList: [])) {
    on<AddCartEvent>((event, emit) {
      final List<CartItem> updatedList = List.from(state.cartList)
        ..add(event.cartItem!);
      emit(CartSuccess(cartList: updatedList));
    });
    on<RemoveCartEvent>((event, emit) {
      final updatedList = List<CartItem>.from(state.cartList);
      final index =
          updatedList.indexWhere((item) => item.id == event.cartItem!.id);
      updatedList.removeAt(index);
      emit(CartSuccess(cartList: updatedList));
    });
    on<PlusButtonEvent>((event, emit) {
      final updatedList = List.from(state.cartList);
      final index =
          updatedList.indexWhere((item) => item.id == event.cartItem!.id);
      updatedList[index] =
          event.cartItem!.copyWith(quantity: updatedList[index].quantity + 1);
      emit(
        CartSuccess(
          cartList: updatedList,
        ),
      );
    });
    on<MinusButtonEvent>((event, emit) {
      final updatedList = List<CartItem>.from(state.cartList);
      final index =
          updatedList.indexWhere((item) => item.id == event.cartItem!.id);
      if (index != -1) {
        if (updatedList[index].quantity > 1) {
          updatedList[index] = event.cartItem!
              .copyWith(quantity: updatedList[index].quantity - 1);
        } else {
          updatedList.removeAt(index);
        }
      }
      emit(CartSuccess(cartList: updatedList));
    });
    on<SumProductEvent>((event, emit) {
      final updatedList = List<CartItem>.from(state.cartList);
      int priceOfProducts = 0;

      for (int i = 0; i < updatedList.length; i++) {
        final int price = updatedList[i].price;
        priceOfProducts += price * updatedList[i].quantity;
      }

      // Copy existing sum and sumDelivery
      emit(
        SumProductState(
          sum: state.sum ??
              0 + priceOfProducts, // Copy existing sum, if any, and add priceOfProducts
          sumDelivery: state.sumDelivery ??
              0 + 15 + priceOfProducts, // Same for sumDelivery
          cartList: state.cartList,
        ),
      );
    });
  }
}
