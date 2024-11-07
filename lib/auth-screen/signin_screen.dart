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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> registration() async {
    isLoading = true;
    setState(() {

    });
    await FirebaseAuth.instance.
    createUserWithEmailAndPassword
      (email: emailController.text.trim(),
        password: passwordController.text.trim())
        .then((value) {
      isLoading = false;

      setState(() {

      });
      Get.snackbar('Congratulations', 'Your account successfully created',
          backgroundColor:Colors.blue.withOpacity(.5) ,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 1),
          icon: Icon(Icons.thumb_up,color: Colors.green,)

      );
      Get.to(() => LoginScreen());
    }).onError((error, value) {
      isLoading = false;
      setState(() {
      });

      Get.snackbar('Error:', '$error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.withOpacity(.5),
        duration: Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
        icon: Icon(Icons.error_outline_outlined, color: Colors.red,),

      );
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        title: Text('Registration',style: GoogleFonts.dangrek(color: Colors.white,fontSize: 20),),
        centerTitle: true,
      ),


      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors:
            [

              Colors.deepOrangeAccent.shade200.withOpacity(0.3),
              Colors.green.shade400.withOpacity(0.5),
            ]

            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.deepOrangeAccent.shade400)
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(color: Colors.green.shade400),
                      prefixIcon: Icon(Icons.mail_lock,color: Colors.green.shade400,),
                      border: InputBorder.none

                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 40,
                  width: 300,
                  decoration:BoxDecoration(
                    border: Border.all(color: Colors.deepOrangeAccent.shade400),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextFormField(

                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(

                      hintText: 'Enter Your Password',
                      hintStyle: TextStyle(color: Colors.green.shade400),
                      prefixIcon: Icon(Icons.password_outlined,color: Colors.green.shade400,),
                        border: InputBorder.none

                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              isLoading?CircularProgressIndicator(): InkWell(
                onTap: (){
                  registration();

                },

                child: Container(

                 height: 40,
                 width: 200,
                 decoration: BoxDecoration(
                     color: Colors.deepOrangeAccent.shade200,
                     borderRadius: BorderRadius.circular(100)
                 ),
                 child: Center(child: Text('Register',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                 ),
                        ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account ?',style: TextStyle(fontSize: 15),),
                  SizedBox(width: 3,),

              GestureDetector(
                onTap: (){
                  Get.to(()=>LoginScreen());
                },
                child: Text('Login',style: TextStyle(color:
                Colors.green.shade400),),
              )
                ],
              ),


          ],
            ),
        ),
      )
      ,
    );
  }
}
