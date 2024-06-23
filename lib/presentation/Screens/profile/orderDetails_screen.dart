// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/orderDetails_paymentCard.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/orderDetails_productCard.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/ordersDatailsSmall_card.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/orderDetails_addressCard.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.leadingWithTitle('Order details'),
      body: ListView(
        children: const [
          //set of cards
          OrdersDetailsSmallCard(),
          //products cards
          OrderDetailsProductCard(),
          //address card
          OrderDetailsAddressCard(),
          //payment card
          PaymentCard(),
        ],
      ),
    );
  }
}
