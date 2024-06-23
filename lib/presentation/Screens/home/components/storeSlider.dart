import 'package:flutter/material.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/topTitle.dart';

class StoreSlider extends StatelessWidget {
  const StoreSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopTitle(
          title: 'Store',
          onTap: () {},
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 13,
                  left: 16,
                  right: 16,
                ),
                child: Image.asset(
                  'assets/images/store${index + 1}.png',
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
