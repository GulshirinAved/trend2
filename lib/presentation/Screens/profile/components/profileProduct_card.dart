import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/blocs/carts/cart_bloc/cart_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/cartItem_model.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/fav_button.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/profile_button.dart';

class ProfileProductCard extends StatelessWidget {
  final int index;
  const ProfileProductCard({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.grey16Color,
        ),
        borderRadius: AppBorderRadius.borderRadius6,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: ClipRRect(
                borderRadius: AppBorderRadius.borderRadius6,
                child: Image.asset(
                  manCloth1Image,
                  height: 98.h,
                  width: 80.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 126.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //brand name
                      Text(
                        topProducts[index].brand,
                        style: TextStyle(
                          color: AppColors.darkGrey1Color,
                          fontWeight: FontWeight.w600,
                          fontSize: AppFonts.font12,
                        ),
                      ),

                      //favbutton and trash
                      Row(
                        children: [
                          FavButton(
                            inActiveColor: AppColors.darkGrey3Color,
                            favItem: FavItem(
                              id: topProducts[index].id,
                              image: topProducts[index].image,
                              price: topProducts[index].price,
                              brand: topProducts[index].brand,
                              desc: topProducts[index].desc,
                              starRating: topProducts[index].starRating,
                              previousPrice: topProducts[index].previousPrice,
                              discount: topProducts[index].discount,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              trashIcon,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //desc
                Container(
                  width: MediaQuery.of(context).size.width - 126.w,
                  padding: EdgeInsets.only(top: 6.h, bottom: 17.h),
                  child: Text(
                    topProducts[index].desc,
                    style: TextStyle(
                      color: AppColors.grey1Color,
                      fontWeight: FontWeight.w400,
                      fontSize: AppFonts.font12,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 126.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${topProducts[index].price} TMT',
                        style: TextStyle(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.w400,
                          fontSize: AppFonts.font12,
                        ),
                      ),
                      ProfileButton(
                        index: index,
                        isCart: true,
                        onTap: () => context.read<CartBloc>().add(
                              AddCartEvent(
                                cartItem: CartItem(
                                  id: topProducts[index].id,
                                  image: topProducts[index].image,
                                  price: topProducts[index].price,
                                  brand: topProducts[index].brand,
                                  desc: topProducts[index].desc,
                                  starRating: topProducts[index].starRating,
                                  previousPrice:
                                      topProducts[index].previousPrice,
                                  discount: topProducts[index].discount,
                                ),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
