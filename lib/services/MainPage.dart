import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../sliding_login.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  signOut() async{
    try{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Login()) );
    }
    catch(e){
      print(e.toString());
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('HomeScreen')
    );
  }
}
