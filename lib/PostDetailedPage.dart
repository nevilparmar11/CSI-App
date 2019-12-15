import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csi/AppInfo.dart';
import 'package:flutter/material.dart';

class PostDetailedPage extends StatefulWidget {

  final DocumentSnapshot post;
  PostDetailedPage({this.post});

  @override
  _PostDetailedPageState createState() => _PostDetailedPageState();
}

class _PostDetailedPageState extends State<PostDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.post.data["title"]),
      backgroundColor: theme_color,),
      body: Center(
        child: Text(
          widget.post.data["excerpt"]
        ),
      ),
    );
  }
}