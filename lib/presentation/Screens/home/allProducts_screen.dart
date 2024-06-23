import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_marketplace2/blocs/allProducts/filterCheckSelection/filter_check_selection_bloc.dart';
import 'package:trend_marketplace2/blocs/allProducts/sort/sort_bloc.dart';
import 'package:trend_marketplace2/blocs/productProfile/cardSelection/card_selection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/filter_modalSheet.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/product_card.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CardSelectionBloc(),
        ),
        BlocProvider(
          create: (context) => SortBloc(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar.filterAndSort(
          filterAndSort: filterSortList,
          hintText: 'T shirts (156 prosucts)',
        ),
        body: BlocBuilder<CardSelectionBloc, CardSelectionState>(
          builder: (context, state) {
            return state.selectiedIndex == -1
                ? const GridViewProducts()
                : Stack(
                    children: [
                      //all products
                      const GridViewProducts(),
                      //darkness
                      GestureDetector(
                        onTap: () {
                          context
                              .read<CardSelectionBloc>()
                              .add(const CardSelectionEvent(-1));
                          context
                              .read<FilterCheckSelectionBloc>()
                              .add(CancelEvent());
                        },
                        child: BackdropFilter(
                          blendMode: BlendMode.darken,
                          filter: ImageFilter.blur(
                            sigmaX: 0,
                            sigmaY: 0,
                          ),
                          child: Container(
                            color: AppColors.blackColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      //filter top modal
                      FilterTopModal(
                        topCardTitle: filterSortList[state.selectiedIndex]
                            ['title'],
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: topProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisExtent: MediaQuery.of(context).size.width * 0.8,
      ),
      itemBuilder: (context, index) {
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
    );
  }
}
