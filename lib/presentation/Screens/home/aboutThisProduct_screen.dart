import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/bottomNavBar/profileBottomNavBar_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/additionInfo_tile.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/productImageTitle_tile.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/productInfo.dart';

class AboutThisProductScreen extends StatelessWidget {
  final FavItem favItem;
  final CartItem cartItem;

  const AboutThisProductScreen({
    required this.favItem,
    required this.cartItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar.normalwithFav('About this product', heartIcon, favItem),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(16),
        color: AppColors.whiteColor,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product image and title tile
              ProductNameAndImage(imageName: favItem.image),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Product information tile
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      topTitle(title: 'Product Information'),
                      const ProductInfo(),
                      const Divider(),
                    ],
                  ),
                  //Additional information
                  const AdditionInfoTile(),
                ],
              ),
            ]),
      ),
      bottomNavigationBar: ProfileBottomNavBar(cartItem: cartItem),
    );
  }
}

Padding topTitle({required String title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Text(
      title,
      style: TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w400,
        fontSize: AppFonts.font12,
      ),
    ),
  );
}

Widget additionalText({
  required BuildContext context,
  required String text,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        Container(
          height: 5,
          width: 5,
          margin: const EdgeInsets.symmetric(horizontal: 9),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.blueColor,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 55,
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.grey2Color,
              fontWeight: FontWeight.w400,
              fontSize: AppFonts.font12,
            ),
          ),
        ),
      ],
    ),
  );
}
