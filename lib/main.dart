import 'package:csi/services/MainPage.dart';
import 'package:csi/sliding_login.dart';
import 'package:flutter/material.dart';
import 'package:csi/splash_screen.dart';
import 'package:csi/SignUpPage.dart';

void main() => runApp(MaterialApp(
    theme: 
        ThemeData(primaryColor: Colors.blue, accentColor: Colors.blueAccent ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
));

class home_screen extends StatefulWidget {
  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen() ,
      routes: <String, WidgetBuilder>{
        '/MainPage': (BuildContext context) => new MainPage(),
        '/LoginPage': (BuildContext context)=> new Login(),
        '/signupPage': (BuildContext context)=>new SignUpPage(),
        //'/homePage': (BuildContext context)=>new MainPage(),
      },
    );
  }
}