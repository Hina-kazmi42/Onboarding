import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateData extends StatefulWidget {
  String docid;
   UpdateData({super.key, required this.docid});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  updateData()async{
    try{
      isLoading=true;
      setState(() {

      });
      String id=DateTime.now().millisecond.toString();
      await FirebaseFirestore.instance.collection('Todo')
          .doc(widget.docid)
          .update({
        'title': titleController.text,
        'description': descriptionController.text,
        'id':id,

      });
    }
    catch(error){
      isLoading=false;
      setState(() {

      });

    }finally
    {
      Get.back();

    }
  }

  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:  Color(0xff47001c ),
          title: Text('Update Data',style: GoogleFonts.ibarraRealNova(color: Colors.white,fontSize: 20),),

        ),
        body: Container(      decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff47001c).withOpacity(.5),
              Color(0xff971132).withOpacity(.5),
            ], begin: Alignment.topRight, end: Alignment.bottomRight)),

          child: Center(child: Column(
            children: [
              SizedBox(height: 50,),
              Text('Update Data',style: GoogleFonts.sahitya(color:  Color(0xff47001c ),fontSize: 40),),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color:  Color(0xff47001c ),width: 2),

                  borderRadius:BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 10),
                  child: TextFormField(

                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter Title ',
                      hintStyle: TextStyle(color:  Color(0xff47001c )),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color:  Color(0xff47001c ),width: 2),

                  borderRadius:BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 10),
                  child: TextFormField(

                    controller: descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Enter Description ',
                      hintStyle: TextStyle(color:  Color(0xff47001c ),),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              isLoading?SpinKitDualRing(color: Colors.black):InkWell(
                onTap: () {

                  Get.defaultDialog(
                      title: 'Confirmation',
                      titleStyle: TextStyle(color:  Color(0xff47001c )),
                      content: Text('You want to delete it ?',style: TextStyle(color:  Color(0xff47001c )),),
                  actions:
                  [
                  TextButton(

                  onPressed: (){
                  updateData();
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
                child: Container(

                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color:  Color(0xff47001c ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(child: Text('Update',style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),),
              ),

            ],
          ),),
        )


    );
  }
}
