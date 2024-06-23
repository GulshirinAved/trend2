import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class OrderDetailsAddressCard extends StatelessWidget {
  const OrderDetailsAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16).copyWith(top: 0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: AppBorderRadius.borderRadius6,
        border: Border.all(
          color: AppColors.grey16Color,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Address',
              style: TextStyle(
                color: AppColors.darkGrey1Color,
                fontWeight: FontWeight.w600,
                fontSize: AppFonts.font14,
              ),
            ),
          ),
          Divider(
            color: AppColors.grey19Color,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowTitle(
                icon: routingIcon,
                title: 'Zuidplein 116 Tower H, Floor 14, 1077XV',
              ),
              RowTitle(
                icon: call1Icon,
                title: '+993 65 646362',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RowTitle extends StatelessWidget {
  final String icon;
  final String title;
  const RowTitle({
    required this.icon,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w400,
              fontSize: AppFonts.font12,
            ),
          ),
        ],
      ),
    );
  }
}
