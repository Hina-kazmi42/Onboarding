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

class _ContainerClassState extends State<ContainerClass>with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignment;
  late Animation<Alignment> _bottomAlignment;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 4));
    // TODO: this is for topAlignment Animation
    _topAlignment=TweenSequence<Alignment>(
      [
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.topLeft,end: Alignment.topRight) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.topRight,end: Alignment.bottomRight) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.bottomRight,end: Alignment.bottomLeft) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.bottomLeft,end: Alignment.topLeft) , weight:1),
      ],
    ).animate(_controller);
    // TODO: this is for bottomAlignment Animation

    _bottomAlignment=TweenSequence<Alignment>(
      [
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.bottomRight,end: Alignment.bottomLeft) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.bottomLeft,end: Alignment.topLeft) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.topLeft,end: Alignment.topRight) , weight:1),
        TweenSequenceItem(tween:Tween<Alignment>(begin: Alignment.topRight,end: Alignment.bottomRight) , weight:1),
      ],
    ).animate(_controller);
    _controller.repeat();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(title: Text('Expanded Widget Example')),
      body: Center(
        child: AnimatedBuilder(animation: _controller, builder: (context,_){
          return Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors:  [
                  Colors.deepPurple,
                  Colors.deepOrangeAccent,
                ],
                  begin: _topAlignment.value,
                  end: _bottomAlignment.value,
                )
            ),

          );


        }),
      ),

      );
  }
}
