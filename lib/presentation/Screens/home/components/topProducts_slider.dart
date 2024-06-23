import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/product_card.dart';
import 'package:trend_marketplace2/presentation/Screens/home/allProducts_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/topTitle.dart';

class TopProductsSlider extends StatelessWidget {
  const TopProductsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopTitle(
          title: 'Top products',
          onTap: () {
            pushScreenWithNavBar(context, const AllProductsScreen());
          },
        ),
        //slider of top products
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: topProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(
                index: index,
                favItem: FavItem(
                  id: topProducts[index].id,
                  image: topProducts[index].image,
                  price: topProducts[index].price,
                  brand: topProducts[index].brand,
                  desc: topProducts[index].desc,
                  starRating: topProducts[index].starRating,
                  previousPrice: topProducts[index].previousPrice,
                  discount: topProducts[index].discount,
                ),
                cartItem: CartItem(
                  id: topProducts[index].id,
                  image: topProducts[index].image,
                  price: topProducts[index].price,
                  brand: topProducts[index].brand,
                  desc: topProducts[index].desc,
                  starRating: topProducts[index].starRating,
                  previousPrice: topProducts[index].previousPrice,
                  discount: topProducts[index].discount,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
