// import 'package:flutter/material.dart';
//
// class ContainerClass extends StatefulWidget {
//   const ContainerClass({super.key});
//
//   @override
//   State<ContainerClass> createState() => _ContainerClassState();
// }
//
// class _ContainerClassState extends State<ContainerClass> with SingleTickerProviderStateMixin{
//  late  Animation animation;
//
//  late AnimationController animationController;
//  void initState(){
//    super.initState();
//    animationController=AnimationController(vsync: this,duration: Duration(seconds: 10));
//    animation=Tween(begin:0.0,end:150.0 ).animate(animationController);
//
//    animationController.addListener((){
//
//      setState(() {
//
//      });
//
//
//    });
//    animationController.forward();
//  }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: animation.value,
//           width: animation.value,
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.only(
//                 topLeft:Radius.circular(100),
//             bottomRight: Radius.circular(200)),
//
//           ),
//
//         ),
//       ),
//     );
//   }
// }
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
import 'package:flutter/material.dart';
class ContainerClass extends StatefulWidget {
  const ContainerClass({super.key});

  @override
  State<ContainerClass> createState() => _ContainerClassState();
}

class _ContainerClassState extends State<ContainerClass> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(title: Text('Expanded Widget Example')),
      body: Column(
      children: [
      Container(
      color: Colors.red,
      height: 100,
      child: Center(child: Text('Fixed height container')),
      ),
      Expanded(
      child: Container(
      color: Colors.blue,
      child: Center(child: Text('This container expands')),
      ),
      ),
      Container(
      color: Colors.green,
      height: 100,
      child: Center(child: Text('Fixed height container')),
      ),
      ],
      ),
      );
  }
}
