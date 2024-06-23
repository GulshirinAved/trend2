import 'package:flutter/material.dart';
import 'package:trend_marketplace2/presentation/Screens/home/AboutThisProduct_screen.dart';

class AdditionInfoTile extends StatelessWidget {
  const AdditionInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topTitle(title: 'Additional info'),
        additionalText(
          context: context,
          text:
              'A maximum of 10 units of this product can be ordered. Trend reserves the right to cancel orders over 10 units',
        ),
        additionalText(
          context: context,
          text: 'Sold and fulfilled by Trend',
        ),
      ],
    );
  }
}
