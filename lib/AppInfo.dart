import 'package:flutter/material.dart';
import 'MyProfile.dart';

const Color theme_color = Color(0xFF13182B);
const Color bg_color = Color(0xFFF6C753);

class AppInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About Me"),
        backgroundColor: theme_color,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          height: 600,
          width: 400,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              MyProfile("Nevil Parmar", "Android Developer", "Vadodara",
                  "nevilparmar24@gmail.com"),
              myImage("images/nevil.JPG"),
            ],
          ),
        ),
      ),
    );
  }
}
