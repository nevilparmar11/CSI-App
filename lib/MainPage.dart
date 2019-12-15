import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:csi/AppInfo.dart';
import 'package:csi/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './sliding_login.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart' as prefix0;
import 'package:url_launcher/url_launcher.dart' as prefix1;
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:csi/PostDetailedPage.dart';



class MainPage extends StatefulWidget {
  MainPage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  choiceAction(String choice) {
    if (choice == Constants.AppInfo) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AppInfo()));
    } else if (choice == Constants.VisitSite) {
      launchCustomTab(context, "https://dduconnect.in");
    } else if (choice == Constants.AboutMe) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AppInfo()));
    } else if (choice == Constants.Moodle) {
      launchCustomTab(context, "https://egov.ddit.ac.in");
    }
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await prefix1.launch(url);
    } else {
      Fluttertoast.showToast(
        msg: "Oops...Failed To Complete The Action..!!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  void launchCustomTab(BuildContext context, String url) async {
    try {
      await prefix0.launch(
        url,
        option: prefix0.CustomTabsOption(
            toolbarColor: theme_color,
            enableUrlBarHiding: true,
            showPageTitle: false,
            animation: prefix0.CustomTabsAnimation(
                startEnter: 'slide_up',
                startExit: 'android:anim/fade_out',
                endEnter: 'android:anim/fade_in',
                endExit: 'slide_down')),
      );
    } catch (e) {}
  }
  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    } catch (e) {
      print(e.toString());
    }
  }

  Color theme_color = Color(0xFF13182B);
  Color bg_color = Color(0xFFF6C753);

  Future _getPosts() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        QuerySnapshot data = await Firestore.instance.collection('posts').getDocuments();
        return data.documents;
      } else {
        HapticFeedback.heavyImpact();
        Fluttertoast.showToast(
          msg: "No Internet Access..!!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
      elevation: 0.1,
      backgroundColor: theme_color,
      title: Text("CSI-DDU"),
      centerTitle: true,
    ),
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Container(
        child: FutureBuilder(
          future: _getPosts(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 4.0,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(theme_color),
                  ),
                ),
              );
            } else {
             return CustomScrollView(scrollDirection: Axis.vertical, slivers: <
                  Widget>[
                
                 SliverList(
                    delegate: SliverChildListDelegate(
                  List.generate(snapshot.data.length, (int i) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        height: 410,
                        color: Colors.white,
                        margin: EdgeInsets.all(20),
                        child: Material(
                          shadowColor: Colors.cyanAccent,
                          elevation: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ListTile(
                                  title: Text(
                                    snapshot.data[i].data["title"],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PostDetailedPage(post: snapshot.data[i])))),
                              Container(
                                width: 250,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: Image.network(
                                    snapshot.data[i].data["source_url"],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  snapshot.data[i].data["smalldesc"],
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.date_range, size: 20),
                                    Text(
                                      snapshot.data[i].data["date"],
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ))
              ]);
            }
          },
        ),
      ),
    );
  }
}
