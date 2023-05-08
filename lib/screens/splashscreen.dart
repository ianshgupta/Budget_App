import 'dart:async';

import 'package:budget_app/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),(){
      //pushreplacement bcoz we are replacing (not keeping one screen on another) the splash screen to the home screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>nav()) );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pink,
        child: Center(child: Text("UBudget",
          style: TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),)) ,
      ),
    );
  }
}
