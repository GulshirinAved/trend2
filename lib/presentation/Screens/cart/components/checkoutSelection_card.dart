import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/blocs/carts/checkOutSelectionCard/check_out_selection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class SelectionCardCheckout extends StatelessWidget {
  final int index;
  final Color color;

  const SelectionCardCheckout({
    required this.index,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<CheckOutSelectionBloc>()
            .add(CheckOutSelectionEvent(pressIndex: index));
      },
      child: BlocBuilder<CheckOutSelectionBloc, CheckOutSelectionState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width / 2.w,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: AppColors.grey16Color,
              ),
              borderRadius: state.selectedIndex == index
                  ? AppBorderRadius.borderRadius6
                  : index == 0
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(6.r),
                          topLeft: Radius.circular(6.r),
                        )
                      : BorderRadius.only(
                          bottomRight: Radius.circular(6.r),
                          topRight: Radius.circular(6.r),
                        ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              checkOutCardSelection[index]['icon']),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            checkOutCardSelection[index]['title'],
                            style: TextStyle(
                              color: index == 0
                                  ? AppColors.blueColor
                                  : AppColors.grey2Color,
                              fontWeight: FontWeight.w600,
                              fontSize: AppFonts.font12,
                            ),
                          ),
                        ],
                      ),
                      index == 0
                          ? const SizedBox.shrink()
                          : Text.rich(
                              TextSpan(
                                text: 'You can make your payment safely using ',
                                style: TextStyle(
                                  color: AppColors.grey2Color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppFonts.font8,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' Debit ',
                                    style: TextStyle(
                                      color: AppColors.darkGrey1Color,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppFonts.font8,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'or',
                                    style: TextStyle(
                                      color: AppColors.grey2Color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Credit Card',
                                    style: TextStyle(
                                      color: AppColors.darkGrey1Color,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppFonts.font8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                BlocBuilder<CheckOutSelectionBloc, CheckOutSelectionState>(
                  builder: (context, state) {
                    return state.selectedIndex == index
                        ? Container(
                            height: 6.h,
                            width: MediaQuery.of(context).size.width / 2.w,
                            decoration: BoxDecoration(
                              color: AppColors.blueColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(6.r),
                                bottomLeft: Radius.circular(6.r),
                              ),
                              border: Border.all(
                                color: AppColors.blueColor,
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
