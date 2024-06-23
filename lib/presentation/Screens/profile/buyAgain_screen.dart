import 'package:flutter/material.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/profileProduct_card.dart';

class BuyAgainScreen extends StatelessWidget {
  const BuyAgainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.leadingWithTitle('Buy again'),
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
