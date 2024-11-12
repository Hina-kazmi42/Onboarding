import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboardding_screen/auth-screen/login_screen.dart';
import 'package:onboardding_screen/home-screen/insertdata-screen/insert-data.dart';
import 'package:onboardding_screen/home-screen/update-screen/update-data.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(()=>InsertData());
      },backgroundColor: Color(0xff47001c ),
        child: Icon(Icons.add,color: Colors.white,),),
      appBar: AppBar(
        backgroundColor: Color(0xff47001c ),
        title: Text('Home Screen',style: GoogleFonts.habibi(color: Colors.white,fontSize: 30),),

        actions: [
          IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut();
            Get.back();

          }, icon: Icon(Icons.login_outlined,color: Colors.white,))
        ],
      ),
      body: Container(

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
        child: StreamBuilder(

            stream: FirebaseFirestore.instance.collection('Todo').snapshots(),
            builder:(context, AsyncSnapshot<QuerySnapshot> snapshot)

            {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: SpinKitDualRing(color: Colors.black),);
              }

              final data= snapshot.requireData;
              return ListView.builder(
                itemCount: data.size,
                  itemBuilder: (context,Index){
                    String docid=data.docs[Index]['id'];
                  return Card(
                    color: Color(0xff740938 ),

                    child: ListTile(

                      onLongPress: (){
                        Get.to(()=>UpdateData(
                            docid: docid));


                      },
                      onTap: (){
                        Get.defaultDialog(
                          backgroundColor: Colors.white,
                          title: 'Confirmation',
                              titleStyle: TextStyle(color:  Color(0xff47001c )),
                              content: Text('You want to delete it ?',style: TextStyle(color:  Color(0xff47001c )),),
                            actions:
                            [
                              TextButton(

                                  onPressed: ()async{
                                    await FirebaseFirestore.instance.
                                    collection('Todo')
                                        .doc(docid)
                                        .delete();
                                    Get.back();
                                  },
                                  child: Text('Yes') ),
                              SizedBox(width: 5,),
                              TextButton(
                                  onPressed: (){
                                    Get.back();

                                  },
                                  child: Text('No'))
                            ]

                        );
                      },
                      leading: CircleAvatar(
                        backgroundColor: Color(0xffAF1740 ),
                        child: Text(docid,style: TextStyle(color: Colors.white),),
                        ),

                      title: Text(data.docs[Index]['title'],style: TextStyle(color: Colors.white),),
                      subtitle: Text(data.docs[Index]['description'],style: TextStyle(color: Colors.white)),
                    ),

                  );


                  });
            }

        ),
      )


    );
  }
}
