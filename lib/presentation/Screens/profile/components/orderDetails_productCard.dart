import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class OrderDetailsProductCard extends StatelessWidget {
  const OrderDetailsProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16).copyWith(top: 0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.grey16Color),
        borderRadius: AppBorderRadius.borderRadius6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Products',
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
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    //image
                    ClipRRect(
                      borderRadius: AppBorderRadius.borderRadius4,
                      child: Image.asset(
                        manCloth1Image,
                        height: 80.h,
                        width: 80.h,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //brand and desc
                          Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width - 134.h,
                            ),
                            child: Text.rich(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: topProducts[0].brand.toString(),
                                    style: TextStyle(
                                      color: AppColors.darkGrey1Color,
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppFonts.font12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/${topProducts[0].desc}',
                                    style: TextStyle(
                                      color: AppColors.grey1Color,
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppFonts.font12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //size and color
                          const Row(
                            children: [
                              RowTitle(
                                leftText: 'Size:',
                                rightText: 'L',
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              RowTitle(
                                leftText: 'Color:',
                                rightText: 'Black',
                              ),
                            ],
                          ),
                          //discount
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.pinkColor,
                                  borderRadius: AppBorderRadius.borderRadius4,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 3,
                                  horizontal: 5,
                                ),
                                margin: const EdgeInsets.only(right: 7),
                                child: Text(
                                  '-20 %',
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppFonts.font12,
                                  ),
                                ),
                              ),
                              // price,previousPrice
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1600 m',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: AppColors.darkGrey8Color,
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppFonts.font8,
                                    ),
                                  ),
                                  Text(
                                    '1425 m',
                                    style: TextStyle(
                                      color: AppColors.black1Color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppFonts.font12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: AppColors.grey19Color,
              endIndent: 10,
              indent: 10,
            ),
            itemCount: 2,
          ),
        ],
      ),
    );
  }
}

class RowTitle extends StatelessWidget {
  final String leftText;
  final String rightText;
  const RowTitle({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leftText,
          style: TextStyle(
            color: AppColors.darkGreyColor,
            fontWeight: FontWeight.w400,
            fontSize: AppFonts.font10,
          ),
        ),
        Text(
          rightText,
          style: TextStyle(
            color: AppColors.darkGrey1Color,
            fontWeight: FontWeight.w400,
            fontSize: AppFonts.font10,
          ),
        ),
      ],
    );
  }
}
