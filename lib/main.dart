import 'package:flutter/material.dart';
import 'package:csi/splash_screen.dart';


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
    return Scaffold(
      body: Text("Home Screen"),
    );
  }
}