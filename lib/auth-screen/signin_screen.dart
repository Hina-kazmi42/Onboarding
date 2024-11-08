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
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
          backgroundColor:Colors.white.withOpacity(.5) ,
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
        backgroundColor: Colors.white.withOpacity(.5),
        duration: Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
        icon: Icon(Icons.error_outline_outlined, color: Colors.red,),

      );
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body:Stack (
        children:[ 
          Padding(
            padding: const EdgeInsets.only(left: 150,top: 10),
            child: Text('Registeration', style: GoogleFonts.tauri(fontWeight: FontWeight.w800,fontSize: 30,color: Colors.black),),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 150,top: 100),
            child: Image(image: AssetImage('lib/assets/website.png'),height: 140,width: 150,),
          ),
          Container(
        
          decoration: BoxDecoration(
              gradient: LinearGradient(colors:
              [
        
                Color(0xff47001c ).withOpacity(.5),
                Color(0xff971132 ).withOpacity(.5),
              ],
                begin: Alignment.topRight,
                end: Alignment.bottomRight

        
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(height: 150,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:Color(0xff47001c ),width: 2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 10),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'Enter your full name',
                            hintStyle: TextStyle(color: Color(0xff47001c )),
                            border: InputBorder.none

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:Color(0xff47001c ),width: 2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 10),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Enter Your Email',
                            hintStyle: TextStyle(color: Color(0xff47001c )),
                            border: InputBorder.none

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff47001c ),width: 2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 10),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Color(0xff47001c )),
                          border: InputBorder.none

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
        
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 40,
                    width: 350,
                    decoration:BoxDecoration(
                      border: Border.all(color: Color(0xff47001c ),width: 2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 10),
                      child: TextFormField(

                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your confirm password',
                          hintStyle: TextStyle(color: Color(0xff47001c )),
                            border: InputBorder.none

                        ),
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
                       color:   Color(0xff47001c ),
        
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
                    Text('Already have an account ?',style: TextStyle(fontSize: 15,color:Color(0xff47001c )),),
                    SizedBox(width: 3,),
        
                GestureDetector(
                  onTap: (){
                    Get.to(()=>LoginScreen());
                  },
                  child: Text('Login',style: TextStyle(color: Colors.white
                   ),),
                )
                  ],
                ),
        
        
        
            ],
              ),
          ),
        ),
        ],
      ),
      
    );
  }
}
