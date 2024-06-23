import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trend_marketplace2/blocs/carts/cart_bloc/cart_bloc.dart';
import 'package:trend_marketplace2/blocs/favbutton_bloc/fav_button_bloc.dart';

import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/Screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('addressBox');
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      ensureScreenSize: true,
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FavButtonBloc(),
          ),
          BlocProvider(
            create: (context) => CartBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trand',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.whiteColor),
            scaffoldBackgroundColor: AppColors.grey10Color,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.whiteColor,
              surfaceTintColor: AppColors.whiteColor,
              elevation: 0.1,
            ),
            tabBarTheme: TabBarTheme(
              dividerColor: Colors.transparent,
              indicatorColor: AppColors.blueColor,
              labelColor: AppColors.blueColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                color: AppColors.blueColor,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                color: AppColors.darkGrey6Color,
                fontWeight: FontWeight.w600,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.whiteColor,
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.blueColor,
            ),
            fontFamily: segoeFont,
            useMaterial3: true,
          ),
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: child!,
          ),
          home: const SplashScreen(),
        ),
      ),
    ),
  );
}
