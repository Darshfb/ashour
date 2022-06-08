import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ashour/Layout/ashour_layout.dart';
import 'package:ashour/Modules/Login/login.dart';
import 'package:ashour/Modules/onboarding_page/onboarding_page.dart';
import 'package:ashour/Shared/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/splash_screen.png', fit: BoxFit.cover),
      nextScreen: (onBoarding) ? (getToken == null) ? LoginScreen(): AshourLayout() : OnBoardingView(),
      splashIconSize: double.infinity,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.transparent,
      duration: 500,
    );
  }
}
