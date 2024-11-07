
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:onboardding_screen/auth-screen/signin_screen.dart';
class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignment;
  late Animation<Alignment> _bottomAlignment;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 4));
    // TODO: this is for topAlignment Animation
    _topAlignment=TweenSequence<Alignment>(
      [
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.topLeft,end: Alignment.topRight) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.topRight,end: Alignment.bottomRight) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.bottomRight,end: Alignment.bottomLeft) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.bottomLeft,end: Alignment.topLeft) , weight:1),
      ],
    ).animate(_controller);
    // TODO: this is for bottomAlignment Animation

    _bottomAlignment=TweenSequence<Alignment>(
      [
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.bottomRight,end: Alignment.bottomLeft) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.bottomLeft,end: Alignment.topLeft) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.topLeft,end: Alignment.topRight) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.topRight,end: Alignment.bottomRight) , weight:1),
      ],
    ).animate(_controller);

    _controller.repeat();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: Stack(
        children: [ Column(
          children: [
            Expanded(


              child:

              AnimatedBuilder(
                animation: _controller,
                builder: (context,_){
                  return   Container(

                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors:  [

                          Color(0xff47001c ),
                          Color(0xff971132 ),
                        ],

                          begin: _topAlignment.value,
                          end: _bottomAlignment.value,
                        )
                    ),
                    child: Center(child: Text('Todo App',style: GoogleFonts.tauri(color: Colors.green,fontSize: 50,fontWeight: FontWeight.w800),),

                    ),
                  );

                }


              ),
            ),
            Expanded(

                child:

            Container(child:
             AnimatedSplashScreen(


              splash: Center(
                  child:LottieBuilder.asset('lib/assets/animation/Animation2.json')

               )
               , nextScreen:  SigninScreen(),
               splashIconSize: 3000,
              duration:10000,
               backgroundColor: Color(0xffAF1740).withOpacity(.8)



               )
             )),
            Expanded(child: AnimatedBuilder(
                animation: _controller,
                builder: (context,_){
                  return   Container(

                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors:  [
                          Color(0xff47001c ),
                          Color(0xff971132 ),
                        ],
                          begin: _bottomAlignment.value,
                          end: _topAlignment.value,
                        )
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(child: Text('Developed by',style: GoogleFonts.tauri(color: Colors.white24,fontSize: 20,fontWeight: FontWeight.w200),),
                      ),
                      Center(child: Text('S.Hina Zahra',style: GoogleFonts.racingSansOne(color: Colors.white54,fontSize: 30,fontWeight: FontWeight.w300),),
                      ),
                    ],
                  )
                  );
                }


            ),



            )

          ],
        ),

        ],
      ),

    );
  }
}
