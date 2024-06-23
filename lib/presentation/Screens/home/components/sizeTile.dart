import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/size_card.dart';

class SizeTile extends StatelessWidget {
  const SizeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Size',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFonts.font12,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(barcodeIcon),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Size chart',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: AppFonts.font12,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //size card
          Container(
            height: 40,
            margin: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: sizeList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizeCard(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
