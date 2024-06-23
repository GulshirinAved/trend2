import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_marketplace2/blocs/carts/cart_bloc/cart_bloc.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';

class CartButton extends StatelessWidget {
  final CartItem cartItem;
  const CartButton({required this.cartItem, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final isItemInCart =
            state.cartList.any((item) => item.id == cartItem.id);

        return Button(
          backColor: isItemInCart
              ? AppColors.blueColor.withOpacity(0.1)
              : AppColors.blueColor,
          textSize: AppFonts.font10,
          textColor: isItemInCart ? AppColors.blueColor : AppColors.whiteColor,
          onTap: () {
            if (!isItemInCart) {
              context.read<CartBloc>().add(AddCartEvent(cartItem: cartItem));
              context.read<CartBloc>().add(SumProductEvent(cartItem: null));
            }
          },
          title: isItemInCart == true ? 'Added' : 'Cart',
          cartButton: isItemInCart ? false : true,
        );
      },
    );
  }
}
