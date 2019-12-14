import 'package:csi/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xff003366),
                Color(0xff003350),
                Color(0xff003340)
              ]
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1, Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),)),
                    SizedBox(height: 10,),
                    FadeAnimation(1.3, Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),)),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Expanded(
                child: SingleChildScrollView(
                     // child: Center(
                      child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 60,),
                            FadeAnimation(1.4, Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                                )]
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.white))
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: Colors.black54),
                                        border: new UnderlineInputBorder()
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.white))
                                    ),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.black54),
                                        border: new UnderlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            SizedBox(height: 40,),
                            //FadeAnimation(1.5, Text("New User? Register Here.", style: TextStyle(color: Colors.grey),)),
                            SizedBox(height: 40,),
                            FadeAnimation(1.6, Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color:  Color(0xff003366)
                              ),
                              child: Center(
                                child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                            )),
                            SizedBox(height: 50,),
                            //FadeAnimation(1.7, Text("Continue with social media", style: TextStyle(color: Colors.grey),)),
                            SizedBox(height: 60,),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: FadeAnimation(1.8, Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue
                                    ),
                                    child: Center(
                                      child: Text("Register New Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                  )),
                                ),
                                // SizedBox(width: 30,),
                                // Expanded(
                                //   child: FadeAnimation(1.9, Container(
                                //     height: 50,
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(50),
                                //       color: Colors.black
                                //     ),
                                //     child: Center(
                                //       child: Text("Github", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                //     ),
                                //   )),
                                // )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                 // ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}