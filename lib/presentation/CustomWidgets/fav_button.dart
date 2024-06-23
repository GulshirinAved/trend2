import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trend_marketplace2/blocs/favbutton_bloc/fav_button_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';

class FavButton extends StatelessWidget {
  final FavItem favItem;
  final Color? inActiveColor;

  const FavButton({required this.favItem, this.inActiveColor, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<FavButtonBloc>().add(ToggleFavEvent(item: favItem));
      },
      child: BlocBuilder<FavButtonBloc, FavButtonState>(
        builder: (context, state) {
          final isFav = state.favList.any((item) => item.id == favItem.id);
          return SvgPicture.asset(
            isFav ? favoriteIcon : heartIcon,
            height: 15.h,
            width: 15.h,
            colorFilter: ColorFilter.mode(
              isFav
                  ? inActiveColor ?? AppColors.blueColor
                  : AppColors.blueColor,
              BlendMode.srcIn,
            ),
          );
        },
      ),
    );
  }
}
