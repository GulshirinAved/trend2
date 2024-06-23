import 'package:flutter/material.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
  });

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
              'Payments',
              style: TextStyle(
                color: AppColors.darkGrey1Color,
                fontWeight: FontWeight.w600,
                fontSize: AppFonts.font14,
              ),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                RowTitle(
                  leftText: 'Payment type:',
                  rightText: 'cash',
                ),
                RowTitle(
                  leftText: 'Total price:',
                  rightText: '1758 m',
                ),
                RowTitle(
                  leftText: 'Shipping total:',
                  rightText: '+ 25 m',
                ),
                RowTitle(
                  leftText: 'Discount:',
                  rightText: '- 120 m',
                ),
                RowTitle(
                  leftText: 'Discount:',
                  rightText: '- 120 m',
                  isTotal: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowTitle extends StatelessWidget {
  final String leftText;
  final String rightText;
  final bool? isTotal;
  const RowTitle({
    required this.leftText,
    required this.rightText,
    this.isTotal = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: TextStyle(
            color: AppColors.black1Color,
            fontWeight: isTotal == false ? FontWeight.w600 : FontWeight.w700,
            fontSize: isTotal == false ? AppFonts.font16 : AppFonts.font20,
          ),
        ),
        Text(
          rightText,
          style: TextStyle(
            color: AppColors.black1Color,
            fontWeight: isTotal == false ? FontWeight.w600 : FontWeight.w700,
            fontSize: isTotal == false ? AppFonts.font14 : AppFonts.font20,
          ),
        ),
      ],
    );
  }
}
