import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboardding_screen/auth-screen/login_screen.dart';

class SigninScreen extends StatefulWidget {
   SigninScreen({super.key });

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Registration',style: GoogleFonts.dangrek(color: Colors.white,fontSize: 20),),
        centerTitle: true,
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(height: 40,),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                hintStyle: TextStyle(color: Colors.blue),
                prefixIcon: Icon(Icons.mail_lock,color: Colors.blue,),

              ),
            ),
            SizedBox(height: 20,),

            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter Your Password',
                hintStyle: TextStyle(color: Colors.blue),
                prefixIcon: Icon(Icons.password_outlined,color: Colors.blue,),

              ),
            ),
            SizedBox(height: 20,),

          InkWell(
            onTap: ()async{
              await FirebaseAuth.instance.
              createUserWithEmailAndPassword
                (email: emailController.text.trim(), password: passwordController.text.trim()).then((value){
                  Get.defaultDialog(


                    content: Icon(Icons.thumb_up,color: Colors.green,size: 15,),
                    title: 'Congratulations',
                    titleStyle: TextStyle(
                      color: Colors.green,
                    )

                  );
                  Get.to(()=>LoginScreen());

              }).onError((error,value){
                Get.snackbar('Error:', '$error',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.blue.withOpacity(.5),

                );


              });
              



            },
            child: Container(

              height: 40,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Center(child: Text('Register',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),),
          ),
        ],),
      )
      ,
    );
  }
}
