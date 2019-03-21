import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
        title: 'cryptocurrency',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
            textTheme: TextTheme(title: TextStyle(color: Colors.white))),
        home: SplashScreen());
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => HomePage()));
    //  Navigator.of(context).pushReplacementNamed('_');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor:Color.fromRGBO(58, 66, 86, 1.0),
      body: new Center(
        child: Icon(
          Icons.local_atm,
          size: 200.0,
          color: Colors.white70,
        ),
        
        ),
      );
    }}