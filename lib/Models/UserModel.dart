import 'dart:core';

class User {
   String name,email,password,branch,studentId;
   String semester,phoneNo;
   
   User(String uid,String name,String email,String password,String branch,String studentId,String semester,String phoneNo){
     this.name = name;
     this.email = email;
     this.password = password;
     this.branch = branch;
     this.studentId = studentId;
     this.semester = semester;
     this.phoneNo = phoneNo;
   }
}