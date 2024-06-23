import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/addAddress_screen.dart';

class AddAdressButton extends StatelessWidget {
  const AddAdressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushScreenWithoutNavBar(context, const AddAdressScreen()),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.borderRadius4,
          border: Border.all(
            color: AppColors.blueColor,
          ),
        ),
        child: Row(
          children: [
            Icon(
              CupertinoIcons.plus,
              color: AppColors.blueColor,
            ),
            Text(
              'Add adress',
              style: TextStyle(
                color: AppColors.blueColor,
                fontWeight: FontWeight.w600,
                fontSize: AppFonts.font12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
