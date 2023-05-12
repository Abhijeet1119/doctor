import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/auth/signInScreen.dart';
import 'package:flutterapp/User/home.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../Doctor/DoctorRegistration/DoctorSignUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/profile.dart';

var Role = "User";

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  _SignupScreenState();

  // final _formKey = GlobalKey<FormState>();
  // String? _name;
  // String? _email;
  // String? _password;
  // String? _userName;
  // // String? _confirpassword;
  // bool _isLoading = false;
  //
  // void _signUp() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     // Logging in the user w/ Firebase
  //     String result = await AuthMethods().signUpUser(
  //         name: _name, email: _email, password: _password);
  //     if (result != 'success') {
  //       showSnackBar(result, context);
  //     } else {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => home(),
  //         ),
  //       );
  //       // Navigator.pop(context);
  //     }
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController = new TextEditingController();
  final TextEditingController nameControler = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  // var Role = "User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 198, 186, 212),
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
                          height: 40.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 21, right: 85),
                          child: Text(
                            'Create New Account',
                            style: GoogleFonts.montserrat(
                                fontSize: 24.0,
                                color: Colors.purpleAccent.shade700,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 80),
                          child: Text(
                            "Enter Your Details to Create a new account",
                            style: GoogleFonts.montserrat(
                                fontSize: 17.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Are you a doctor?",
                                style: GoogleFonts.montserrat(
                                    fontSize: 16.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              TextButton(
                                onPressed: () {
                                  Role="Doctor";
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoctorSignUp()),
                                  );
                                },
                                child: Text(
                                  "Sign Up here",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromARGB(255, 108, 46, 223),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showProgress = true;
                            });
                            signUp(nameControler.text, emailController.text,
                                passwordController.text, Role);
                          },
                          // onPressed: () => _signUp(),
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
                          ),
                        ),
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
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            ),
                            TextButton(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInScreen()),
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
        builder: (context) => home(),
      ),
    );
  }
}
