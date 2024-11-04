import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboardding_screen/starting-screen/onboarding-screen.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Get.to(()=>OnboardingScreen());
    }

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(

        children: [

          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('lib/assets/splash.png',),),
                ],
              ),
            ),
          ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                      Text('Instant',style:GoogleFonts.eagleLake(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800),),
                      SizedBox(width: 5,),
                      Text('Translator',style: GoogleFonts.fahkwang(color: Colors.white,fontSize: 20,),),
                      ],
                      ),
                  SizedBox(height: 10,),
                  SpinKitFadingCircle(color: Colors.white,),

                ],
              ),
            ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 600),
              child: Column(
                children: [
                  Text('Developed By',style:GoogleFonts.abrilFatface(color: Colors.white,fontSize: 7,),),
                  SizedBox(height: 2,),
                  Text('Syeda Hina Zahra',style: GoogleFonts.abyssinicaSil(color: Colors.white,fontSize: 10,),),
                ],
              ),
            ),
          )
        ],


      ),

    );
  }
}
