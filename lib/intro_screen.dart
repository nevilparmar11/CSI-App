import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:csi/sliding_login.dart';

class intro_screen extends StatefulWidget {
  @override
  _intro_screenState createState() => _intro_screenState();
}

class _intro_screenState extends State<intro_screen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();


    slides.add(
      Slide(
        title: "Interactive Sessions",
        styleTitle:
            TextStyle(color: Color(0xff000000), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description: "Share your ideas with your friends and collegues.",
        styleDescription:
            TextStyle(color: Color(0xff000000), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        pathImage: "assets/images/sessions.png",
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
    slides.add(
      Slide(
        title: "Exciting Events",
        styleTitle:
            TextStyle(color: Color(0xff000000), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description: "Be a part of exclusive events coming up in your timeline",
        styleDescription:
            TextStyle(color: Color(0xff000000), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        pathImage: "assets/images/events.png",
        backgroundColor: Color(0xff09f9f5),
      ),
    );
    slides.add(
      Slide(
        title: "Terms and Conditions",
        styleTitle:
            TextStyle(color: Color(0xff000000), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono',  ),
        pathImage: "assets/images/terms.png",
		    
        description:
			    "You agree or not, \n Hit Next !! \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        styleDescription:
            TextStyle(color: Color(0xff000000), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
		    backgroundColor: Color(0xffc1c34d),
      ),
    );
  }

  void onDonePress() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Login()) );
  }

  void onSkipPress() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Login()) );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffD02090),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffD02090),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffD02090),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      colorSkipBtn: Color(0x33000000),
      highlightColorSkipBtn: Color(0xff000000),

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: Color(0x33000000),
      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: Color(0x33D02090),
      colorActiveDot: Color(0xffD02090),
      sizeDot: 13.0,
    );
  }
}

