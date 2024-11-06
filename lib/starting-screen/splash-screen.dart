import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onboardding_screen/auth-screen/signin_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: LottieBuilder.asset('lib/assets/animation/Animation2.json')
        )
        , nextScreen:  SigninScreen(),
      splashIconSize: 3000,
      duration: 5000,

      backgroundColor: Colors.grey,

    );
  }
}
