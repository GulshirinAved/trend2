import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/blocs/allProducts/filterCheckSelection/filter_check_selection_bloc.dart';
import 'package:trend_marketplace2/blocs/productProfile/imageScrolling_bloc/image_scrolling_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/cart_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/category/category_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/favorite/favorite_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/home/home_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageScrollingBloc(),
        ),
        BlocProvider(
          create: (context) => FilterCheckSelectionBloc(),
        ),
      ],
      child: Scaffold(
        body: PersistentTabView(
          tabs: List.generate(
            bottomNavBarItemName.length,
            (index) => PersistentTabConfig(
              screen: getScreenForIndex(index),
              item: ItemConfig(
                inactiveIcon: SvgPicture.asset(
                  bottomNavBarItemName[index]['icon'],
                  colorFilter: ColorFilter.mode(
                    AppColors.darkGrey1Color,
                    BlendMode.srcIn,
                  ),
                ),
                icon: SvgPicture.asset(
                  bottomNavBarItemName[index]['iconBold'],
                  colorFilter:
                      ColorFilter.mode(AppColors.blueColor, BlendMode.srcIn),
                ),
                title: bottomNavBarItemName[index]['label'],
                textStyle: TextStyle(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFonts.font12,
                ),
              ),
            ),
          ),
          navBarBuilder: (navBarConfig) => Style4BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        ),
      ),
    );
  }

  Widget getScreenForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CategoryScreen();
      case 2:
        return const FavoriteScreen();
      case 3:
        return const CartScreen();
      default:
        return const ProfileScreen();
    }
  }
}
