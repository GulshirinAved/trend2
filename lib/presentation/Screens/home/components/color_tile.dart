import 'package:flutter/material.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class ColorTile extends StatelessWidget {
  const ColorTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color',
            style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
              fontSize: AppFonts.font12,
            ),
          ),
          SizedBox(
            height: 65,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 2),
                  child: Image.asset(
                    'assets/images/color${index + 1}.png',
                    height: 47,
                    width: 37,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
