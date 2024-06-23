import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/blocs/carts/cart_bloc/cart_bloc.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';

class CartCountButton extends StatelessWidget {
  final CartItem cartItem;
  final int index;
  const CartCountButton({
    required this.cartItem,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      width: 70.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: AppBorderRadius.borderRadius8,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context
                  .read<CartBloc>()
                  .add(MinusButtonEvent(cartItem: cartItem));
              context.read<CartBloc>().add(SumProductEvent(cartItem: null));
            },
            child: Icon(
              CupertinoIcons.minus,
              color: AppColors.darkGrey1Color,
              size: 20.h,
            ),
          ),
          Container(
            height: 20.h,
            width: 20.h,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.blueColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Text(
                  state.cartList[index].id == cartItem.id
                      ? state.cartList[index].quantity.toString()
                      : '0',
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.w500,
                    fontSize: AppFonts.font10,
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<CartBloc>().add(PlusButtonEvent(cartItem: cartItem));
              context.read<CartBloc>().add(SumProductEvent(cartItem: null));
            },
            child: Icon(
              size: 20.h,
              CupertinoIcons.plus,
              color: AppColors.blueColor,
            ),
          ),
        ],
      ),
    );
  }
}
