import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';
import 'package:trend_marketplace2/presentation/Screens/home/AboutThisProduct_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/productInfo.dart';

class AboutProductTile extends StatelessWidget {
  final FavItem favItem;
  final CartItem cartItem;

  const AboutProductTile(
      {required this.favItem, required this.cartItem, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushScreenWithNavBar(
          context,
          AboutThisProductScreen(
            favItem: favItem,
            cartItem: cartItem,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About this product',
              style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: AppFonts.font12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Column(
              children: [
                //product desc
                ProductInfo(),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'All product details',
                style: TextStyle(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFonts.font14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
