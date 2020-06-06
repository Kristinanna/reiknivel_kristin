import 'package:calculatorapp/main.dart';
import 'package:flutter/material.dart';
import'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _mockCheckForSession().then(
        (status) {
          if (status) {
            _navigateToHome();
          }
        }
    );
  }
  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds:5000),() {});
        return true;
  }
  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen()
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
                Opacity(
                 opacity: 0.9,
                child: Icon
                  (FontAwesomeIcons.calculator,
              size: 120, color: Colors.lime),
                ),


               // child: Image(
                  //  image: AssetImage('assets/lime_background.jpg')
      ],
          ),
        ),
      ),
    );
  }
}
//https://www.youtube.com/watch?v=FFh0z5IWHWc
//https://www.youtube.com/watch?v=FFh0z5IWHWc
//https://fontawesome.com/icons/calculator?style=solid