import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:csi/AppInfo.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart' as prefix0;
import 'package:url_launcher/url_launcher.dart' as prefix1;
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  
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


  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "CSI-DDU",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            accountEmail: Text(
              "csiddu@gmail.com",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
            ),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                //    backgroundImage: NetworkImage(
                //        "https://www.sarvgyan.com/hc/wp-content/uploads/2014/05/Dharmsinh-Desai-University-Nadiad-Kheda.jpg"),
                backgroundImage: AssetImage("images/app_icon.png"),
                backgroundColor: Colors.black,
              ),
            ),
            //  decoration: BoxDecoration(color: theme_color),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/splashscreen_image.jpg",
                    ),
                    fit: BoxFit.fill)),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.home,
                size: 20,
                color: theme_color,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                Fluttertoast.showToast(
                  msg: "You Are Currently On The Home Screen..!!!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              },
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.image,
                size: 20,
                color: theme_color,
              ),
              title: Text(
                "Gallery",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                launchCustomTab(context, 'https://dduconnect.in/gallery/');
              },
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.people,
                size: 20,
                color: theme_color,
              ),
              title: Text(
                "About Us",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                launchCustomTab(context, 'https://dduconnect.in/about-us/');
              },
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.calendar_view_day,
                size: 20,
                color: theme_color,
              ),
              title: Text(
                "Calendar",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                launchURL(
                    'https://drive.google.com/file/d/1VfxqscQr785d8gMP08pzp3zqM0vKFzaI/');
              },
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.cloud_download,
                size: 20,
                color: theme_color,
              ),
              title: Text(
                "Past Year Papers",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                launchURL(
                    'https://drive.google.com/drive/folders/1nhXCmxn7HTWP6QFCi59KP9D0JreAB3Sw');
              },
            ),
          ),
          Divider(
            color: theme_color,
            height: 15,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.turned_in,
                size: 20,
                color: theme_color,
              ),
              title: Text(
                "Get In Touch",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                launchCustomTab(
                    context, 'https://dduconnect.in/about-us/contact-us/');
              },
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.bug_report,
                size: 20,
                color: theme_color,
              ),
              title: Text(
                "Report A Bug",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                launchURL("mailto:nevilparmar24@gmail.com?subject=BugReport");
              },
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.info,
                size: 20,
                color: theme_color,
              ),
              title: Text(
                "Version",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              subtitle: Text(
                "1.0",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                return Fluttertoast.showToast(
                  msg: "Hurrahh...You Have The Latest Version..!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              },
            ),
          ),
          Divider(
            color: theme_color,
            height: 15,
          ),
          InkWell(
            child: ListTile(
              leading: Icon(
                Icons.feedback,
                size: 20,
                color: theme_color,
              ),
              title: Text(
                "Send Feedback",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                return Fluttertoast.showToast(
                  msg: "Send Feedback Via Email Or SMS..!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              },
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(
                Icons.email,
                size: 20,
                color: theme_color,
              ),
              title: Text(
                "Via Email",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                launchURL("mailto:nevilparmar24@gmail.com?subject=Feedback");
                return Fluttertoast.showToast(
                  msg: "Sending Feedback Via Email..!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              },
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(
                Icons.sms,
                size: 20,
                color: theme_color,
              ),
              title: Text(
                "Via SMS",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                launchURL("sms:7600616919");
                return Fluttertoast.showToast(
                  msg: "Sending Feedback Via SMS...!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              },
            ),
          ),
        ],
      ));
  }
}