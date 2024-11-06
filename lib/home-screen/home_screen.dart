import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Todo').snapshots(),
          builder:(context, AsyncSnapshot<QuerySnapshot> snapshot)
          {
            final data= snapshot.requireData;
            return ListView.builder(
              itemCount: data.size,
                itemBuilder: (context,Index){
                return Card(

                  color: Colors.blue,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(data.docs[Index]['id'],)
                    ),
                    title: Text(data.docs[Index]['title']),
                    subtitle: Text(data.docs[Index]['description']),
                  ),

                );


                });
          }

      )


    );
  }
}
