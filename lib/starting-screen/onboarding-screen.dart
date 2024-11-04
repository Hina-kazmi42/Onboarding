

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboardding_screen/auth-screen/login_screen.dart';
import 'package:onboardding_screen/auth-screen/signin_screen.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Widget pageBuilder(String text4,String text3,String image, String text1,String text2){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text4,style:GoogleFonts.aBeeZee(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w800),),
          SizedBox(width: 2,),
          Text(text3,style: GoogleFonts.abhayaLibre(color: Colors.blue,fontSize: 20,),),
        ],
      ),

      SizedBox(height: 40,),
      Image.asset(image,width: 300,height: 300,),
      SizedBox(height: 40,),
      Padding(
        padding: EdgeInsets.only(right: 250),
        child: Text(text1,style: GoogleFonts.abrilFatface(fontSize: 20,fontWeight: FontWeight.w400),),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text( text2,style: TextStyle(fontSize: 11),),
      )
    ],

    );
    
  }
  PageController pageController=PageController();
  int currentIndex=0;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [

          PageView(
            controller: pageController,onPageChanged: (index){
              currentIndex=index;
              setState(() {

              });
          },
            children: [

              //page1

              pageBuilder(' Instant ',' Translator','lib/assets/page1.png', 'Translate Text Instantly,\n Connect Globally!' ,''
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                  ' Lorem Ipsum has been the industrys standard dummy text ever.'),



              //page2
              pageBuilder(' Instant ',' Translator','lib/assets/page02.png','Speak and Understand \nInstantly',''
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                  'Lorem Ipsum has been the industry\'s standard dummy text ever.'),


              //page3
             pageBuilder('Instant',' Translator','lib/assets/page3.png','Capture Translate and \nUnderstand Instantly!',
                 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                 'Lorem Ipsum has been the industry\'s standard dummy text ever.'),

            ],
          ),
          currentIndex<2?
          Center(

            child: SingleChildScrollView(

              scrollDirection: Axis.horizontal,

              child:

              Row(

                children: [

                  Padding(

                    padding: const EdgeInsets.only(top: 570,left: 30),
                    child: TextButton(

                      onPressed: () {


                      },
                      child: Text('skip', style: TextStyle(color: Colors.blue),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 320, top: 580,),
                    child: GestureDetector(
                      onTap: () {
                        pageController.nextPage(duration:Duration(milliseconds: 200), curve: Curves.easeIn);



                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100,),
                          color: Colors.blue,
                        ),
                        child: Center(child: Icon(Icons.arrow_forward_outlined,color: Colors.white,),),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ):
          GestureDetector(onTap: (){
            Get.to(()=>SigninScreen());


          },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 570),
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('GET STARTED ',style: TextStyle(color: Colors.white ),)
                              )
              ),
            ),
          ),
        ],
        
      ),
    );
  }
}
