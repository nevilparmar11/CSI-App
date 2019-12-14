import 'package:csi/Animation/FadeAnimation.dart';
import 'package:csi/Models/UserModel.dart';
import 'package:csi/sliding_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:csi/services/database.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  static String uid, name, email, password, branch, studentId, semester,phoneNo;
  static String verificationId;  
  static String smsOTP;    
  static String errorMessage = '';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = new GlobalKey<FormState>();

  bool validateAndSave(){
    final form  = formKey.currentState;
    if(form.validate())
    {
      form.save();
      return true;
    }
    return false;
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> verifyPhone() async {    
        final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {    
            SignUpPage.verificationId = verId;    
            smsOTPDialog(context).then((value) {    
            print('sign in');    
            });    
        };    
        try {    
            await _auth.verifyPhoneNumber(    
                phoneNumber: "+91" + SignUpPage.phoneNo, // PHONE NUMBER TO SEND OTP    
                codeAutoRetrievalTimeout: (String verId) {    
                //Starts the phone number verification process for the given phone number.    
                //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.    
                SignUpPage.verificationId = verId;    
                },    
                codeSent:    
                    smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.    
                timeout: const Duration(seconds: 60),    
                verificationCompleted: (AuthCredential phoneAuthCredential) {    
                print(phoneAuthCredential);    
                },    
                verificationFailed: (AuthException exceptio) {    
                print('${exceptio.message}');    
                });    
        } catch (e) {    
            handleError(e);    
        }    
    }    
    
    Future<bool> smsOTPDialog(BuildContext context) {    
        return showDialog(    
            context: context,    
            barrierDismissible: false,    
            builder: (BuildContext context) {    
                return new AlertDialog(    
                title: Text('Enter SMS Code'),    
                content: Container(    
                    height: 85,    
                    child: Column(children: [    
                    TextField(    
                        onChanged: (value) {    
                        SignUpPage.smsOTP = value;    
                        },    
                    ),    
                    (SignUpPage.errorMessage != ''    
                        ? Text(    
                            SignUpPage.errorMessage,    
                            style: TextStyle(color: Colors.red),    
                            )    
                        : Container())    
                    ]),    
                ),    
                contentPadding: EdgeInsets.all(10),    
                actions: <Widget>[    
                    FlatButton(    
                    child: Text('Done'),    
                    onPressed: () {    
                        _auth.currentUser().then((user) {    
                        if (user != null) {    
                            Navigator.of(context).pop();    
                            Navigator.of(context).pushReplacementNamed('/MainPage');    
                        } else {    
                            signIn();    
                        }    
                        });    
                    },    
                    )    
                ],    
                );    
        });    
    }    
    
    signIn() async {    
        try {    
            final AuthCredential credential = PhoneAuthProvider.getCredential(    
            verificationId:SignUpPage.verificationId,    
            smsCode:SignUpPage.smsOTP,    
            );    
            final AuthResult user = await _auth.signInWithCredential(credential);    
            final FirebaseUser currentUser = await _auth.currentUser();    
            //assert(user.uid == currentUser.uid);    
            Navigator.of(context).pop();    
            Navigator.of(context).pushReplacementNamed('/MainPage');    
        } catch (e) {    
            handleError(e);    
        }    
    }    
    
    handleError(PlatformException error) {    
        print(error);    
        switch (error.code) {    
            case 'ERROR_INVALID_VERIFICATION_CODE':    
            FocusScope.of(context).requestFocus(new FocusNode());    
            setState(() {    
                SignUpPage.errorMessage = 'Invalid Code';    
            });    
            Navigator.of(context).pop();    
            smsOTPDialog(context).then((value) {    
                print('sign in');    
            });    
            break;    
            default:    
            setState(() {    
                SignUpPage.errorMessage = error.message;    
            });    
    
            break;    
        }    
    }    
  
  void validateAndSubmit() async{
    if(validateAndSave()){
      FirebaseAuth auth = FirebaseAuth.instance;
       final FirebaseUser user = (await auth.createUserWithEmailAndPassword(
      email: SignUpPage.email,
      password: SignUpPage.password,
    )).user;
    if (user != null) {
      print('user creation successful');
      try {
        await user.sendEmailVerification();
        await verifyPhone(); 
     } catch (e) {
        print("An error occured while trying to send email verification");
        print(e.message);
     }
      //create new model of new user
      User usermodel = new User(SignUpPage.uid, 
      SignUpPage.name, 
      SignUpPage.email, 
      SignUpPage.password, 
      SignUpPage.branch, 
      SignUpPage.studentId, 
      SignUpPage.semester, 
      SignUpPage.phoneNo);

      //add extra details of created user
      await DatabaseService(uid:user.uid).updateUserData(usermodel);
      if(user.isEmailVerified){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Login()) );
      }
      else{
        print('Please Verify Your Email');
      }
    } else {
      print('user creation failed');
    }
    }else{
      print('form validation failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xff003366),
            Color(0xff003350),
            Color(0xff003340)
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "SignUp",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.3,
                        Text(
                          "Connect With Us",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  // child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
                          FadeAnimation(
                              1.4,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(225, 95, 27, .3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: TextFormField(
                                          onSaved: (value){
                                            setState(() {
                                              SignUpPage.name = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Name",
                                            hintStyle: TextStyle(
                                                color: Colors.black54),
                                            border: new UnderlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: TextFormField(
                                          onSaved: (value){
                                            setState(() {
                                              SignUpPage.email = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                              hintText: "Email",
                                              hintStyle: TextStyle(
                                                  color: Colors.black54),
                                              border:
                                                  new UnderlineInputBorder()),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: TextFormField(
                                          onSaved: (value){
                                            setState(() {
                                              SignUpPage.password = value;
                                            });
                                          },
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.black54),
                                            border: new UnderlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: TextFormField(
                                          onSaved: (value){
                                            setState(() {
                                              SignUpPage.studentId = value;
                                            });
                                          },
                                          
                                          decoration: InputDecoration(
                                            hintText: "College Id",
                                            hintStyle: TextStyle(
                                                color: Colors.black54),
                                            border: new UnderlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: TextFormField(
                                          onSaved: (value){
                                            setState(() {
                                              SignUpPage.phoneNo = value;
                                            });
                                          },
                                          
                                          decoration: InputDecoration(
                                            hintText: "Phone No.",
                                            hintStyle: TextStyle(
                                                color: Colors.black54),
                                            border: new UnderlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(9),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: DropDownFormField(
                                          titleText: 'Branch',
                                          hintText: 'Please choose one :',
                                          value: SignUpPage.branch,
                                          onSaved: (value) {
                                            setState(() {
                                              SignUpPage.branch = value;
                                            });
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              SignUpPage.branch = value;
                                            });
                                          },
                                          dataSource: [
                                            {
                                              "display": "CE",
                                              "value": "CE",
                                            },
                                            {
                                              "display": "IT",
                                              "value": "IT",
                                            },
                                            {
                                              "display": "CH",
                                              "value": "CH",
                                            },
                                            {
                                              "display": "MH",
                                              "value": "MH",
                                            },
                                            {
                                              "display": "Civil",
                                              "value": "Civil",
                                            },
                                            {
                                              "display": "IC",
                                              "value": "IC",
                                            },
                                            {
                                              "display": "EC",
                                              "value": "EC",
                                            },
                                          ],
                                          textField: 'display',
                                          valueField: 'value',
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(9),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: DropDownFormField(
                                          titleText: 'Semester',
                                          hintText: 'Please choose one :',
                                          value: SignUpPage.semester,
                                          onSaved: (value) {
                                            setState(() {
                                              SignUpPage.semester = value;
                                            });
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              SignUpPage.semester = value;
                                            });
                                          },
                                          dataSource: [
                                            {
                                              "display": "1",
                                              "value": "1",
                                            },
                                            {
                                              "display": "2",
                                              "value": "2",
                                            },
                                            {
                                              "display": "3",
                                              "value": "3",
                                            },
                                            {
                                              "display": "4",
                                              "value": "4",
                                            },
                                            {
                                              "display": "5",
                                              "value": "5",
                                            },
                                            {
                                              "display": "6",
                                              "value": "6",
                                            },
                                            {
                                              "display": "7",
                                              "value": "7",
                                            },
                                            {
                                              "display": "8",
                                              "value": "8",
                                            },
                                          ],
                                          textField: 'display',
                                          valueField: 'value',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          //FadeAnimation(1.5, Text("New User? Register Here.", style: TextStyle(color: Colors.grey),)),
                          SizedBox(
                            height: 40,
                          ),
                          FadeAnimation(
                              1.6,
                              Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xff003366)),
                                child: ButtonTheme(
                                  height: 50,
                                  minWidth: 200,
                                  child: FlatButton(
                                    child: Text(
                                      "SignUp",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    onPressed: ()=> validateAndSubmit(),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 50,
                          ),
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
