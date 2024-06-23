import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trend_marketplace2/blocs/internetConnection_bloc/internet_connection_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/presentation/Screens/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InternetConnectionBloc()..add(const InternetListenEvent()),
      child: Scaffold(
        body: BlocListener<InternetConnectionBloc, InternetConnectionState>(
          listener: (context, state) {
            if (state is InternetConnectedState) {
              Future.delayed(const Duration(seconds: 4), () {
                pushReplacementWithoutNavBar(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              });
            } else if (state is InternetNotConnectedState) {}
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.blue1Color,
                  AppColors.blueColor.withOpacity(0.9),
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    splashImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'trend',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppFonts.font76,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 7,
                      ),
                      child: Text(
                        'New season trend products are waiting for you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AppFonts.font16,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
