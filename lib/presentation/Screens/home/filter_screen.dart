import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/blocs/productProfile/expansionClick/expansion_click_bloc.dart';
import 'package:trend_marketplace2/blocs/allProducts/filterSwitcher/filter_switcher_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/home/filterGender_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/custom_textField.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late TextEditingController toPriceController;
  late TextEditingController fromPriceController;

  @override
  void initState() {
    super.initState();
    toPriceController = TextEditingController();
    fromPriceController = TextEditingController();
  }

  @override
  void dispose() {
    toPriceController.dispose();
    fromPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ExpansionClickBloc(),
        ),
        BlocProvider(
          create: (context) => FilterSwitcherBloc(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar.normal(
          'Filter',
          '',
          () {},
          AppColors.darkGrey2Color,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filterNameList.length,
                  itemBuilder: (context, index) {
                    return filterNameList[index]['title'] == 'Price'
                        ? ExpansionTile(
                            trailing: BlocBuilder<ExpansionClickBloc,
                                ExpansionClickState>(
                              builder: (context, state) {
                                return ExpansionButton(
                                  icon: state.isExpanded == false
                                      ? arrowRightIcon
                                      : arrowUpIcon,
                                );
                              },
                            ),
                            onExpansionChanged: (value) => context
                                .read<ExpansionClickBloc>()
                                .add(ExpansionClickEvent(value)),
                            backgroundColor: AppColors.whiteColor,
                            collapsedBackgroundColor: AppColors.whiteColor,
                            shape: Border.all(color: AppColors.whiteColor),
                            title: Text(
                              'Price',
                              style: TextStyle(
                                color: AppColors.darkGrey1Color,
                                fontWeight: FontWeight.w400,
                                fontSize: AppFonts.font14,
                              ),
                            ),
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PriceTextField(
                                    toPriceController: toPriceController,
                                    hintText: '100',
                                    topTitle: 'To',
                                  ),
                                  PriceTextField(
                                    toPriceController: fromPriceController,
                                    hintText: '5000',
                                    topTitle: 'From',
                                  ),
                                ],
                              ),
                            ],
                          )
                        : ListTile(
                            splashColor: Colors.transparent,
                            onTap: () {
                              filterNameList[index]['openingStyle'] == 0
                                  ? pushScreenWithNavBar(
                                      context,
                                      FilterGenderScreen(
                                        topTitle: filterNameList[index]
                                            ['title'],
                                        id: index,
                                      ),
                                    )
                                  : () {};
                            },
                            tileColor: AppColors.whiteColor,
                            shape: Border.all(
                              color: AppColors.grey14Color,
                              width: 0.5,
                            ),
                            title: Text(
                              filterNameList[index]['title'],
                              style: TextStyle(
                                color: AppColors.darkGrey1Color,
                                fontWeight: FontWeight.w400,
                                fontSize: AppFonts.font14,
                              ),
                            ),
                            trailing: filterNameList[index]['openingStyle'] == 2
                                ?

                                ///switchers
                                BlocBuilder<FilterSwitcherBloc,
                                    FilterSwitcherState>(
                                    builder: (context, state) {
                                      return Switch.adaptive(
                                        trackOutlineColor:
                                            const WidgetStatePropertyAll(
                                          Colors.transparent,
                                        ),
                                        activeTrackColor: AppColors.blueColor
                                            .withOpacity(0.3),
                                        activeColor: AppColors.blueColor,
                                        inactiveThumbColor:
                                            AppColors.grey15Color,
                                        value:
                                            state.switcherList.contains(index),
                                        onChanged: (value) {
                                          if (value) {
                                            context
                                                .read<FilterSwitcherBloc>()
                                                .add(FilterSwitchOn(index));
                                          } else {
                                            context
                                                .read<FilterSwitcherBloc>()
                                                .add(FilterSwitchOff(index));
                                          }
                                        },
                                      );
                                    },
                                  )
                                :
                                //expansion button
                                const ExpansionButton(),
                          );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    onTap: () {},
                    title: 'View items',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpansionButton extends StatelessWidget {
  final String? icon;
  const ExpansionButton({
    super.key,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      width: 21,
      decoration: BoxDecoration(
        color: AppColors.grey15Color,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        icon == null ? arrowRightIcon : icon!,
        colorFilter: ColorFilter.mode(
          AppColors.darkGrey2Color,
          BlendMode.srcIn,
        ),
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

class PriceTextField extends StatelessWidget {
  const PriceTextField({
    required this.toPriceController,
    required this.topTitle,
    required this.hintText,
    super.key,
  });

  final TextEditingController toPriceController;
  final String topTitle;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Text(
            topTitle,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.darkGrey2Color,
              fontWeight: FontWeight.w400,
              fontSize: AppFonts.font12,
            ),
          ),
        ),
        Container(
          width: 125,
          height: 47,
          margin: const EdgeInsets.all(15),
          child: CustomTextField.normal(
            controller: toPriceController,
            hintText: hintText,
            isDigit: true,
            validator: (p0) {
              return null;
            },
          ),
        ),
      ],
    );
  }
}
