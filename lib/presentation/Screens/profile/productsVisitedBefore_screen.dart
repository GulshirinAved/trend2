// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/profileProduct_card.dart';

class ProductsVisitedBeforeScreen extends StatelessWidget {
  const ProductsVisitedBeforeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.normal(
        'Products visited before',
        'Delete all',
        () {},
        AppColors.darkGrey2Color,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        child: ListView.builder(
          itemCount: topProducts.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return ProfileProductCard(
              index: index,
            );
          },
        ),
      ),
    );
  }
}
