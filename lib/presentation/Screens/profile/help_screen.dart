import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trend_marketplace2/blocs/productProfile/expansionClick/expansion_click_bloc.dart';
import 'package:trend_marketplace2/blocs/profile/expansionPanelExpand/expansion_panel_expand_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ExpansionPanelExpandBloc(),
        ),
        BlocProvider(
          create: (context) => ExpansionClickBloc(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar.normalWithActionIcon('Help', () {}, searchIcon),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    tileColor: AppColors.whiteColor,
                    title: Text(
                      'Popular questions',
                      style: TextStyle(
                        color: AppColors.darkGrey5Color,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFonts.font14,
                      ),
                    ),
                    trailing: Text(
                      'See all',
                      style: TextStyle(
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: AppFonts.font14,
                      ),
                    ),
                  ),
                  //expansionPanel for questions
                  Column(
                    children: [
                      ExpansionPanelList.radio(
                        elevation: 0,
                        materialGapSize: 1.5,
                        expansionCallback: (panelIndex, isExpanded) => context
                            .read<ExpansionPanelExpandBloc>()
                            .add(PressEvent(panelIndex: panelIndex)),
                        children:
                            popularAskedQuestions.asMap().entries.map((entry) {
                          final int idx = entry.key;
                          final e = entry.value;
                          return ExpansionPanelRadio(
                            backgroundColor: AppColors.whiteColor,
                            value: idx,
                            headerBuilder: (context, isExpanded) => ListTile(
                              title: Text(
                                e['title'],
                                style: TextStyle(
                                  color: AppColors.darkGrey6Color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppFonts.font14,
                                ),
                              ),
                            ),
                            body: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                textAlign: TextAlign.start,
                                e['answer'],
                                style: TextStyle(
                                  color: AppColors.darkGrey7Color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppFonts.font12,
                                ),
                              ),
                            ),
                            canTapOnHeader: true,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  //All topics expansion

                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: ExpansionTile(
                      maintainState: true,
                      trailing: Icon(
                        Icons.expand_more,
                        color: AppColors.grey5Color.withOpacity(0.9),
                      ),
                      leading: SvgPicture.asset(
                        verifyIcon,
                        height: 20,
                        width: 20,
                      ),
                      onExpansionChanged: (value) => context
                          .read<ExpansionClickBloc>()
                          .add(ExpansionClickEvent(value)),
                      backgroundColor: AppColors.whiteColor,
                      collapsedBackgroundColor: AppColors.whiteColor,
                      shape: Border.all(color: AppColors.whiteColor),
                      title: Text(
                        'All topics',
                        style: TextStyle(
                          color: AppColors.darkGrey5Color,
                          fontWeight: FontWeight.w600,
                          fontSize: AppFonts.font14,
                        ),
                      ),
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxHeight: 600),
                          child: GridView.builder(
                            itemCount: allTopicslist.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 55,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    border: Border.all(
                                      color: AppColors.grey9Color,
                                    ),
                                    borderRadius: AppBorderRadius.borderRadius4,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    allTopicslist[index],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
