import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onboardding_screen/home-screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController   emailController=TextEditingController();
  TextEditingController   passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(height: 20,),

          Text('Login',style: TextStyle(fontWeight: FontWeight.bold),),

          Padding(padding: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.mail_outline_sharp,color: Colors.white,)
                ),

              ),
            ),),
          Padding(padding: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                obscureText: true,

                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.lock_open,color: Colors.red,)
                ),

              ),
            ),),
          InkWell(
            onTap: () async{
             await FirebaseAuth.instance.createUserWithEmailAndPassword
                (email: emailController.text.trim(), password: passwordController.text.trim());


                Get.to(()=>HomeScreen());


            },
            child: Container(

              height: 40,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),),
          ),
        ],),
      )

    );
  }
}
