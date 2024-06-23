import 'package:flutter/material.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/followingStores_card.dart';

class FollowingStoresScreen extends StatelessWidget {
  const FollowingStoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.leadingWithTitleSearch(
        'Following stores',
        'Search from my orders',
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => const FollowingStoresCard(),
      ),
    );
  }
}
