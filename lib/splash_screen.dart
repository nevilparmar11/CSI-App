import 'dart:async';
import 'package:flutter/material.dart';
import 'package:csi/intro_screen.dart';
//import 'package:csi/main.dart';
import 'package:csi/sliding_login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future checkFirstSeen() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if ( _seen ){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    }
    else{
      prefs.setBool('seen', true);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => intro_screen()));
    }
  }

@override
  void initState() {
    super.initState();
	Timer(Duration(seconds: 3),() {
    checkFirstSeen(); 
    });	
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xff003366),
			          gradient: RadialGradient(
				            colors: [ Color(0xff003366), Color(0xff000000) ],
			            ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              	  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70.0,
                    child: Text(
                      "CSI",
                      style: TextStyle(
                        color: Color(0xff003366),
                        fontSize: 65.0,
					              fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
			            
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
			  	          padding: EdgeInsets.only(bottom: 35.0),
		  		        ),
		  		        Text(
			  		        "LEARN SHARE GROW",
			  	  	      style: TextStyle(
				 	            color: Colors.white,
				  	          fontSize: 20.0,
				  	          fontWeight: FontWeight.w700
			  		        ),
				          ),
                ],
              )
            ],
          ),
        );
      }
}