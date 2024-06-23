import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/blocs/productProfile/cardSelection/card_selection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';

import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_textfield.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/fav_button.dart';
import 'package:trend_marketplace2/presentation/Screens/home/components/filterSort_card.dart';
import 'package:trend_marketplace2/presentation/Screens/home/filter_screen.dart';

enum AppBarStyle {
  home,
  filterAndSort,
  onlyWithSearch,
  searchForFilter,
  normal,
  normalWithFav,
  cart,
  leadingWithTitle,
  favorite,
  leadingWithTitleSearch,
  normalWithActionIcon,
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String>? tabBarItems;
  final List<Map<String, dynamic>>? filterAndSort;
  final AppBarStyle appBarStyle;
  final String? hintText;
  final String? title;
  final String? actionText;
  final String? iconName;
  final VoidCallback? iconTap;
  final Color? textColor;
  final FavItem? favItem;

  const CustomAppBar({
    required this.tabBarItems,
    required this.filterAndSort,
    required this.appBarStyle,
    required this.hintText,
    required this.title,
    required this.actionText,
    required this.iconName,
    required this.iconTap,
    required this.textColor,
    this.favItem,
    super.key,
  });
  const CustomAppBar._({
    required this.appBarStyle,
    this.tabBarItems,
    this.filterAndSort,
    this.hintText,
    this.title,
    this.actionText,
    this.iconName,
    this.iconTap,
    this.textColor,
    this.favItem,
  });
  factory CustomAppBar.home(List<String> tabBarItems, String? hintText) {
    return CustomAppBar._(
      tabBarItems: tabBarItems,
      appBarStyle: AppBarStyle.home,
      hintText: hintText,
    );
  }
  factory CustomAppBar.filterAndSort({
    List<Map<String, dynamic>>? filterAndSort,
    String? hintText,
  }) {
    return CustomAppBar._(
      filterAndSort: filterAndSort,
      appBarStyle: AppBarStyle.filterAndSort,
      hintText: hintText,
    );
  }
  factory CustomAppBar.onlyWithSearch(String? hintText) {
    return CustomAppBar._(
      appBarStyle: AppBarStyle.onlyWithSearch,
      hintText: hintText,
    );
  }
  factory CustomAppBar.searchForFilter(final String hintText) {
    return CustomAppBar._(
      appBarStyle: AppBarStyle.searchForFilter,
      hintText: hintText,
    );
  }
  factory CustomAppBar.normal(
    final String title,
    String? actionText,
    VoidCallback onTap,
    Color textColor,
  ) {
    return CustomAppBar._(
      appBarStyle: AppBarStyle.normal,
      title: title,
      actionText: actionText,
      iconTap: onTap,
      textColor: textColor,
    );
  }
  factory CustomAppBar.normalwithFav(
      final String title, final String? iconName, final FavItem favItem) {
    return CustomAppBar._(
      appBarStyle: AppBarStyle.normalWithFav,
      title: title,
      iconName: iconName,
      favItem: favItem,
    );
  }
  factory CustomAppBar.cart(final String title) {
    return CustomAppBar._(
      appBarStyle: AppBarStyle.cart,
      title: title,
    );
  }
  factory CustomAppBar.favorite(final String title) {
    return CustomAppBar._(
      appBarStyle: AppBarStyle.favorite,
      title: title,
    );
  }
  factory CustomAppBar.leadingWithTitle(final String title) {
    return CustomAppBar._(
      appBarStyle: AppBarStyle.leadingWithTitle,
      title: title,
    );
  }
  factory CustomAppBar.leadingWithTitleSearch(
    final String title,
    final String hintText,
  ) {
    return CustomAppBar._(
      appBarStyle: AppBarStyle.leadingWithTitleSearch,
      title: title,
      hintText: hintText,
    );
  }
  factory CustomAppBar.normalWithActionIcon(final String title,
      final VoidCallback onTap, final String actionIconTitle) {
    return CustomAppBar._(
      appBarStyle: AppBarStyle.normalWithActionIcon,
      title: title,
      iconTap: onTap,
      iconName: actionIconTitle,
    );
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: appBarStyle == AppBarStyle.cart ||
              appBarStyle == AppBarStyle.leadingWithTitle ||
              appBarStyle == AppBarStyle.leadingWithTitleSearch ||
              appBarStyle == AppBarStyle.normalWithActionIcon
          ? false
          : true,

      ///actions
      actions: actionText != null && appBarStyle == AppBarStyle.normal
          ? [
              GestureDetector(
                onTap: iconTap,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    actionText!,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: AppFonts.font12,
                    ),
                  ),
                ),
              ),
            ]
          : iconName != null && appBarStyle == AppBarStyle.normalWithFav
              ? [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FavButton(
                      favItem: favItem!,
                    ),
                  ),
                ]
              : appBarStyle == AppBarStyle.leadingWithTitleSearch
                  ? [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200,
                          child: CustomTextField(
                            title: hintText,
                          ),
                        ),
                      ),
                    ]
                  : appBarStyle == AppBarStyle.normalWithActionIcon
                      ? [
                          GestureDetector(
                            onTap: iconTap,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SvgPicture.asset(
                                iconName!,
                                colorFilter: ColorFilter.mode(
                                  AppColors.blueColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ]
                      : [],
      //leading
      leadingWidth: appBarStyle == AppBarStyle.home ? 60 : 40,
      leading: appBarStyle == AppBarStyle.home ||
              appBarStyle == AppBarStyle.cart ||
              appBarStyle == AppBarStyle.favorite
          ? null
          : GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                arrowLeftIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
      //titles
      title: appBarStyle == AppBarStyle.normal ||
              appBarStyle == AppBarStyle.normalWithFav ||
              appBarStyle == AppBarStyle.leadingWithTitle ||
              appBarStyle == AppBarStyle.leadingWithTitleSearch ||
              appBarStyle == AppBarStyle.normalWithActionIcon
          ? Text(
              title!,
              style: TextStyle(
                color: appBarStyle == AppBarStyle.leadingWithTitle
                    ? AppColors.blackColor
                    : AppColors.darkGrey1Color,
                fontWeight: appBarStyle == AppBarStyle.leadingWithTitle
                    ? FontWeight.w600
                    : FontWeight.w700,
                fontSize: AppFonts.font14,
              ),
            )
          : appBarStyle == AppBarStyle.cart
              ? Row(
                  children: [
                    Text(
                      'Cart - ',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFonts.font14,
                      ),
                    ),
                    Text(
                      '$title product',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: AppFonts.font12,
                      ),
                    ),
                  ],
                )
              : appBarStyle == AppBarStyle.favorite
                  ? Row(
                      children: [
                        Text(
                          'Favorites - ',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppFonts.font14,
                          ),
                        ),
                        Text(
                          '$title product',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: AppFonts.font12,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        //name
                        appBarStyle == AppBarStyle.home
                            ? Text(
                                'trend',
                                style: TextStyle(
                                  color: AppColors.darkGrey1Color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppFonts.font22,
                                ),
                              )
                            : const SizedBox.shrink(),
                        //textfield
                        appBarStyle == AppBarStyle.normal ||
                                appBarStyle == AppBarStyle.leadingWithTitle ||
                                appBarStyle ==
                                    AppBarStyle.leadingWithTitleSearch
                            ? const SizedBox.shrink()
                            : Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: CustomTextField(
                                    title: hintText,
                                    isBold: appBarStyle == AppBarStyle.home
                                        ? false
                                        : true,
                                  ),
                                ),
                              ),
                      ],
                    ),
      //bottoms
      //tabbar with category
      bottom: appBarStyle == AppBarStyle.home
          ? PreferredSize(
              preferredSize: const Size.fromHeight(44.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelColor: AppColors.blueColor,
                  indicatorColor: AppColors.blueColor,
                  unselectedLabelStyle: TextStyle(
                    color: AppColors.darkGrey2Color,
                    fontWeight: FontWeight.w400,
                    fontSize: AppFonts.font14,
                  ),
                  labelStyle: TextStyle(
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFonts.font14,
                  ),
                  tabs: List<Widget>.generate(
                    tabBarItems!.length,
                    (index) => Tab(
                      text: tabBarItems![index],
                    ),
                  ),
                ),
              ),
            )
          : appBarStyle == AppBarStyle.filterAndSort
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(30),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: filterSortList.length,
                      itemBuilder: (context, index) {
                        return filterAndSort![index]['title'] == 'Filters'
                            ?
                            //card with badge
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Badge(
                                  backgroundColor: AppColors.blueColor,
                                  label: Text(
                                    '1',
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppFonts.font8,
                                    ),
                                  ),
                                  alignment: Alignment.topRight,
                                  child: FilterSortCard(
                                    filterAndSort: filterAndSort,
                                    index: index,
                                    onTap: () {
                                      pushScreenWithNavBar(
                                        context,
                                        const FilterScreen(),
                                      );
                                    },
                                  ),
                                ),
                              )
                            :
                            //normal card
                            Container(
                                margin: const EdgeInsets.all(8),
                                child: FilterSortCard(
                                  filterAndSort: filterAndSort,
                                  index: index,
                                  onTap: () {
                                    context
                                        .read<CardSelectionBloc>()
                                        .add(CardSelectionEvent(index));
                                  },
                                ),
                              );
                      },
                    ),
                  ),
                )
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        appBarStyle == AppBarStyle.onlyWithSearch ||
                appBarStyle == AppBarStyle.normal ||
                appBarStyle == AppBarStyle.normalWithFav ||
                appBarStyle == AppBarStyle.cart ||
                appBarStyle == AppBarStyle.leadingWithTitle ||
                appBarStyle == AppBarStyle.favorite ||
                appBarStyle == AppBarStyle.leadingWithTitleSearch ||
                appBarStyle == AppBarStyle.normalWithActionIcon
            ? 56
            : 100,
      );
}
