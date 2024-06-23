import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trend_marketplace2/blocs/carts/cart_bloc/cart_bloc.dart';
import 'package:trend_marketplace2/blocs/carts/selectRegion/address_region_select_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/cartPrice_bottomSheet.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/cartProduct_card.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/seeAlso_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddressSelectBloc(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar.cart('1'),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 11.h,
              ),
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return state.cartList.isEmpty
                      //is there is no product
                      ? Column(
                          children: [
                            //icon
                            Container(
                              height: 80.h,
                              width: 80.h,
                              padding: EdgeInsets.all(22.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.blueColor.withOpacity(0.15),
                              ),
                              child: SvgPicture.asset(
                                cartIcon,
                                colorFilter: ColorFilter.mode(
                                  AppColors.blueColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                'There are no products in your cart.',
                                style: TextStyle(
                                  color: AppColors.darkGrey1Color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppFonts.font12,
                                ),
                              ),
                            ),
                            Button(
                              onTap: () {},
                              title: 'Start shopping',
                            ),
                          ],
                        )
                      :
                      //product cards
                      Container(
                          padding: const EdgeInsets.all(7).r,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: AppBorderRadius.borderRadius8,
                          ),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                index: index,
                                cartItem: CartItem(
                                  id: state.cartList[index].id,
                                  image: state.cartList[index].image,
                                  price: state.cartList[index].price,
                                  brand: state.cartList[index].brand,
                                  desc: state.cartList[index].desc,
                                  starRating: state.cartList[index].starRating,
                                  discount: state.cartList[index].discount,
                                  previousPrice:
                                      state.cartList[index].previousPrice,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(
                              color: AppColors.grey14Color,
                              thickness: 1,
                            ),
                            itemCount: state.cartList.length,
                          ),
                        );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: SeeAlsoTile(),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) => state.cartList.isEmpty
              ? const SizedBox()
              : const CartButtomSheet(),
        ),
      ),
    );
  }
}
