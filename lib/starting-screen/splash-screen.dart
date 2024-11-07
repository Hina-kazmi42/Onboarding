import 'package:animate_gradient/animate_gradient.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onboardding_screen/auth-screen/signin_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: Stack(
        children: [ Column(
          children: [
            Expanded(
              child:   Container(

              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.green.shade400,
                  Colors.deepOrangeAccent.shade200
                ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
                child:   Expanded(child: Container(child:
                AnimatedSplashScreen(

                  splash: Center(

                      child:LottieBuilder.asset('lib/assets/animation/Animation2.json')

                  )
                  , nextScreen:  SigninScreen(),
                )
                )),
                
            ),),

          ],
        ),

        ],
      ),

    );
  }
}
