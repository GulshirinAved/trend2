import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        productDesc.length,
        (index) => Row(
          children: [
            Text(
              productDesc[index]['title'],
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final boxWidth = constraints.constrainWidth();
                  final dashWidth = TextPainter(
                    text: const TextSpan(text: '_'),
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                  )..layout();
                  final dashCount = (boxWidth / dashWidth.width).floor();
                  return Text(
                    '_ ' * dashCount,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  );
                },
              ),
            ),
            Text(
              productDesc[index]['desc'],
              maxLines: 1,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
