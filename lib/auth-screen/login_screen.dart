import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onboardding_screen/auth-screen/signin_screen.dart';
import 'package:onboardding_screen/home-screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  Future<void> Login() async {
    isLoading = true;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((onValue) {
      isLoading = false;
      setState(() {});

      Get.snackbar('Successfully', 'Your account login',

          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 1),
          icon: Icon(
            Icons.thumb_up,
            color: Colors.green.shade600,
          ));

      Get.to(() => HomeScreen());
    }).onError((error, handleError) {
      isLoading = false;
      setState(() {});
      Get.snackbar('Error', '$error',
          backgroundColor: Colors.white.withOpacity(.8),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150,top: 40),
              child: Text(
                'Login your account',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xff47001c )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120,top: 100),
              child: Image(image: AssetImage('lib/assets/password.png'),height: 100,width: 150,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 250,top: 100),
              child: Image(image: AssetImage('lib/assets/key.png'),height: 120,width: 200,),
            ),


            Container(
                decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff47001c).withOpacity(.5),
          Color(0xff971132).withOpacity(.5),
                ], begin: Alignment.topRight, end: Alignment.bottomRight)),
                child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 70, ),
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff47001c ),width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Color(0xff47001c )),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff47001c ),width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Color(0xff47001c )),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : InkWell(
                      onTap: () {
                        Login();
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Color(0xff47001c ),
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account ?',
                    style: TextStyle(fontSize: 15,color: Color(0xff47001c )),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SigninScreen());
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
                ),
              ),
          ]

        )
    );
  }
}
