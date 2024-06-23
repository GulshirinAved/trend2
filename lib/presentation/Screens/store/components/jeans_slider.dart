import 'package:flutter/material.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/product_card.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/topTitle.dart';

class JeansSlider extends StatelessWidget {
  const JeansSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopTitle(
          title: 'Jeans',
          isSeeAlso: true,
          onTap: () {},
        ),
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
