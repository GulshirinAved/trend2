import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/blocs/carts/cart_bloc/cart_bloc.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';

class ProfileBottomNavBar extends StatelessWidget {
  final CartItem cartItem;

  const ProfileBottomNavBar({
    required this.cartItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60.h,
      elevation: 1,
      color: AppColors.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '${cartItem.price.toString()} TMT',
                style: TextStyle(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFonts.font16,
                ),
              ),
              cartItem.previousPrice != null
                  ? Container(
                      margin: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: Text(
                        '${cartItem.previousPrice.toString()} TMT',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.grey1Color,
                          fontWeight: FontWeight.w400,
                          fontSize: AppFonts.font10,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final isItemInCart =
                  state.cartList.any((item) => item.id == cartItem.id);
              return Flexible(
                child: Button(
                  onTap: () {
                    if (!isItemInCart) {
                      context
                          .read<CartBloc>()
                          .add(AddCartEvent(cartItem: cartItem));
                      context
                          .read<CartBloc>()
                          .add(SumProductEvent(cartItem: null));
                    }
                  },
                  title: 'Add to bag',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
