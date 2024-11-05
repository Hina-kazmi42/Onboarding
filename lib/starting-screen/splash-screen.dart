import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboardding_screen/home-screen/home_screen.dart';
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
      isLogedin();

    });
  }
  //------ islogedin function
  isLogedin(){

    User user= FirebaseAuth.instance.currentUser!;
    if(user==null)
      {
        Get.to(()=>OnboardingScreen());

      }
    else
      {
        Get.to(()=>HomeScreen());
      }
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
                  Text('Developed By',style:GoogleFonts.gabarito(color: Colors.white.withOpacity(.3),fontSize: 15,),),
                  SizedBox(height: 2,),
                  Text('Syeda Hina Zahra',style: GoogleFonts.abyssinicaSil(color: Colors.white,fontSize: 15,),),
                ],
              ),
            ),
          )
        ],


      ),

    );
  }
}
