import "package:flutter/material.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  //   animation controller
      _controller =AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..forward();

  //   rotation animation
    _rotationAnimation=Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));

  //   radius animation
    _radiusAnimation=Tween(begin: 450.0, end: 10.0).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));

    _controller.addListener((){
      setState(() {});
    });

  //   make animation go back and forth

    _controller.addStatusListener((status){
      if (status== AnimationStatus.completed){
        _controller.reverse();
      }else if (status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdec9e9) ,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
          //   biggest
            Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                width: 225,
                height: 225,
                decoration: BoxDecoration(
                  color: Color(0xff6247aa),
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),

          //   2nd biggest
            Transform.rotate(
              angle: _rotationAnimation.value+0.2,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xffdac3e8),
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),

          //   3rd biggest
            Transform.rotate(
              angle: _rotationAnimation.value+0.6,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Color(0xff7251b5),
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),

          //   4th biggest
            Transform.rotate(
              angle: _rotationAnimation.value+0.8,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xffd2b7e5 ),
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),

          //   5th biggest
            Transform.rotate(
              angle: _rotationAnimation.value+0.8,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xff9163cb ),
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),

          //   6th biggest
            Transform.rotate(
              angle: _rotationAnimation.value+1.0,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Color(0xffc19ee0 ),
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),

            Transform.rotate(
              angle: _rotationAnimation.value+1.2,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff571089 ),
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),

            Transform.rotate(
              angle: _rotationAnimation.value+1.4,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xffa06cd5 ),
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
