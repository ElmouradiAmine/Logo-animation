import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      debugShowCheckedModeBanner: false,
      home: AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    animation = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(animationController);
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });
      
      animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return LogoAnimation(animation: animation,);
  }
}

class LogoAnimation extends AnimatedWidget {
  LogoAnimation({Key key, Animation animation}) : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Center(child: Container(
      height: animation.value,
      width: animation.value,
      child: FlutterLogo(),
    ),);
  }
}