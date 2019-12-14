import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:csi/Models/UserModel.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  //collection Reference
  final CollectionReference users = Firestore.instance.collection('users');

  Future updateUserData(User usermodel) async
  {
    return await users.document(uid).setData({
      'Name' : usermodel.name,
      'Email' : usermodel.email,
      'Password' : usermodel.password,
      'Branch' : usermodel.branch,
      'Semester' : usermodel.semester,
      'Student Id' : usermodel.studentId,
      'Phone No.' : usermodel.phoneNo
    });
  }
}