import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_marketplace2/blocs/category/categorySelection/category_selection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/category/components/categoryLeft_side.dart';
import 'package:trend_marketplace2/presentation/Screens/category/components/categoryRight_side.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategorySelectionBloc(),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: AppColors.lightGreyColor,
          appBar: CustomAppBar.home(categoryGenderName, 'Search in Trend'),
          body: TabBarView(
            children: [
              //woman screen
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //left side with category
                  CategoryLeftSide(
                    pageController: pageController,
                  ),
                  //right side showing subcCategory
                  BlocBuilder<CategorySelectionBloc, CategorySelectionState>(
                    builder: (context, state) {
                      return CategoryRightSide(
                        selectedIndex: state.stateIndex,
                      );
                    },
                  ),
                ],
              ),
              //man screen
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
