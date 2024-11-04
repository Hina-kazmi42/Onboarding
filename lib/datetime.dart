import 'package:flutter/material.dart';
class CurrentDateTime extends StatefulWidget {
  const CurrentDateTime({super.key});

  @override
  State<CurrentDateTime> createState() => _CurrentDateTimeState();
}

class _CurrentDateTimeState extends State<CurrentDateTime> {
  @override
  Widget build(BuildContext context) {
var time=DateTime.now();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Current Date & Time ",style: TextStyle(fontSize: 30,color: Colors.lightGreenAccent),),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: Column(
            children: [
              Text('Date: ${time.year}/${time.month}/${time.day}\n '
                  'Time: ${time.hour}:${time.minute}:${time.second}',style: TextStyle(fontSize: 20),),
              GestureDetector(onTap: (){
                setState(() {

                });
              },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('Current Time',style: TextStyle(fontSize: 20),),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
