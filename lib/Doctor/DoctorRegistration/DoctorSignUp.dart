import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/Doctor/DoctorHomePage.dart';
import 'package:flutterapp/auth/roleWiseAuth/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/auth/signInScreen.dart';
import 'package:flutterapp/User/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:flutterapp/api/apis.dart';
import '../../auth/signUp.dart';
import '../../models/profile.dart';


// var Role = "Doctor";

class DoctorSignUp extends StatefulWidget {
  @override
  _DoctorSignUpState createState() => _DoctorSignUpState();
}

class _DoctorSignUpState extends State<DoctorSignUp> {
  _DoctorSignUpState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
  new TextEditingController();
  final TextEditingController nameControler = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  // var Role = "Doctor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 198,186,212),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 30),
                          child: Text(
                              'Patients are looking for doctors like you',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black12, offset: Offset(5, 5))
                                  ])
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 10, right: 25, left: 30),
                          child: Text(
                            "Millions of patients are looking for the right doctor on Practo."
                                " Start your digital journey with Practo Profile "
                                "\n\nLet’s take the first step and create your account:",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Material(
                            elevation: 10,
                            borderRadius: new BorderRadius.circular(20),
                            shadowColor: Colors.purple,
                            child: TextFormField(
                              controller: nameControler,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Name',
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(20),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length == 0) {
                                  return "Email cannot be empty";
                                }
                              },
                              onChanged: (value) {},
                              // validator: (input) => input!.trim().isEmpty
                              //     ? 'Please enter a valid name'
                              //     : null,
                              // onSaved: (input) => _name = input!,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Material(
                            elevation: 10,
                            borderRadius: new BorderRadius.circular(20),
                            shadowColor: Colors.purple,
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Email',
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(20),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length == 0) {
                                  return "Email cannot be empty";
                                }
                                if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ("Please enter a valid email");
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {},
                              // onSaved: (input) => _email = input!,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Material(
                            elevation: 10,
                            borderRadius: new BorderRadius.circular(20),
                            shadowColor: Colors.purple,
                            child: TextFormField(
                              obscureText: _isObscure,
                              controller: passwordController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    }),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Password',
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 15.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(20),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return "Password cannot be empty";
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("please enter valid password min. 6 character");
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {},
                              // onSaved: (input) => _password = input!,
                              // obscureText: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Material(
                            elevation: 10,
                            borderRadius: new BorderRadius.circular(20),
                            shadowColor: Colors.purple,
                            child: TextFormField(
                              obscureText: _isObscure2,
                              controller: confirmpassController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscure2
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure2 = !_isObscure2;
                                      });
                                    }),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Confirm Password',
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 15.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(20),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) {
                                if (confirmpassController.text !=
                                    passwordController.text) {
                                  return "Password did not match";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showProgress = true;
                            });
                            Role="Doctor";
                            signUp(nameControler.text,emailController.text,
                                passwordController.text, Role);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 108, 46, 223),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            fixedSize: Size(350, 55),
                            elevation: 10,
                            shadowColor: Color.fromARGB(255, 108, 46, 223),
                          ),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.lora(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),),
                        SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            "Or Sign Up With",
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SignInButton(
                              Buttons.LinkedIn,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              mini: true,
                              onPressed: () {},
                            ),
                            SignInButton(
                              Buttons.Facebook,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              mini: true,
                              onPressed: () {},
                            ),
                            SignInButton(
                              Buttons.Twitter,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              mini: true,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              child: Text(
                                'Already Have Account?',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            ),
                            TextButton(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignInScreen()),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(String name, String email, String password, String rool) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(name, email, rool)})
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(String name, String email, String rool) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final chatUser = ChatUser(
        id: user!.uid,
        name: nameControler.text,
        email: emailController.text,
        role: Role,
        about: "Hey, I'm using We Chat!",
        // image: user.photoURL.toString(),
        createdAt: time,
        isOnline: false,
        lastActive: time,
        pushToken: ''
    );

    ref.doc(user!.uid).set(
      chatUser.toJson(),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorHomePage(),
      ),
    );
  }
}
