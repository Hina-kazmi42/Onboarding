import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isLoading = false;

  insertData() async {
    try {
      isLoading = true;
      setState(() {});
      String id = DateTime.now().millisecond.toString();
      await FirebaseFirestore.instance.collection('Todo').doc(id).set({
        'title': titleController.text,
        'description': descriptionController.text,
        'id': id,
      });
    } catch (error) {
      isLoading = false;
      setState(() {});
    } finally {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff47001c),
          title: Text(
            'Insert Data',
            style: GoogleFonts.ibarraRealNova(
                color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff47001c).withOpacity(.8),
            Color(0xff971132).withOpacity(.9),
          ], begin: Alignment.topRight, end: Alignment.bottomRight)),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Insert Data',
                  style: GoogleFonts.sahitya(
                      color:  Color(0xff47001c ), fontSize: 40,fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color:  Color(0xff47001c ),width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff47001c ),width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Enter Description ',
                        hintStyle: TextStyle(
                          color:  Color(0xff47001c ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : InkWell(
                        onTap: () {
                          insertData();
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              color:  Color(0xff47001c ),
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Text(
                              'Add',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
