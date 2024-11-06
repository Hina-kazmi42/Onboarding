import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboardding_screen/auth-screen/login_screen.dart';
import 'package:onboardding_screen/home-screen/insertdata-screen/insert-data.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(()=>InsertData());
      },backgroundColor: Colors.blue,
        child: Icon(Icons.add,color: Colors.white,),),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home Screen',style: GoogleFonts.habibi(color: Colors.white,fontSize: 20),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut();
            Get.back();

          }, icon: Icon(Icons.login_outlined,color: Colors.white,))
        ],
      ),


    );
  }
}
