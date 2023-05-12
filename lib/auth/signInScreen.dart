import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutterapp/Doctor/DoctorHomePage.dart';
import 'package:flutterapp/auth/signUp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/auth/forgotpassword.dart';
import 'package:flutterapp/User/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});
//
//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   bool _isObscure3 = true;
//   bool visible = false;
//   final _formkey = GlobalKey<FormState>();
//   final TextEditingController emailController = new TextEditingController();
//   final TextEditingController passwordController = new TextEditingController();
//   final _auth = FirebaseAuth.instance;
//
//   void route() {
//     User? user = FirebaseAuth.instance.currentUser;
//     var kk = FirebaseFirestore.instance
//         .collection('users')
//         .doc(user!.uid)
//         .get()
//         .then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         if (documentSnapshot.get('rool') == "Doctor") {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DoctorHomePage(),
//             ),
//           );
//         } else {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => home(),
//             ),
//           );
//         }
//       } else {
//         print('Document does not exist on the database');
//       }
//     });
//   }
//
//   void signIn(String email, String password) async {
//     if (_formkey.currentState!.validate()) {
//       try {
//         UserCredential userCredential =
//             await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         route();
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           print('No user found for that email.');
//         } else if (e.code == 'wrong-password') {
//           print('Wrong password provided for that user.');
//         }
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(240, 198,186,212),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/authimg.jpg"), fit: BoxFit.cover),
//             ),
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 25.h),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 50.h,
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 100.h,
//                         width: 100.w,
//                         margin: EdgeInsets.only(left: 105, right: 5),
//                         color: Colors.transparent,
//                         child: Image(
//                           image: AssetImage("assets/logo.webp"),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   SizedBox(
//                     height: 55,
//                     child: TextFormField(
//                       controller: emailController,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         suffixIcon: Icon(
//                           Icons.check_circle_outline,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                         labelText: 'Email',
//                         labelStyle: GoogleFonts.montserrat(
//                             fontSize: 14.0,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w700),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.length == 0) {
//                           return "Email cannot be empty";
//                         }
//                         if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                             .hasMatch(value)) {
//                           return ("Please enter a valid email");
//                         } else {
//                           return null;
//                         }
//                       },
//                       onSaved: (value) {
//                         emailController.text = value!;
//                       },
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   SizedBox(
//                     height: 55,
//                     child: TextFormField(
//                       controller: passwordController,
//                       obscureText: _isObscure3,
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         filled: true,
//                         suffixIcon: Icon(
//                           Icons.remove_red_eye_rounded,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                         labelText: 'Password',
//                         contentPadding: EdgeInsets.symmetric(
//                             vertical: 16.0, horizontal: 16.0),
//                         labelStyle: GoogleFonts.montserrat(
//                             fontSize: 14.0,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w700),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                       ),
//                       validator: (value) {
//                         RegExp regex = new RegExp(r'^.{6,}$');
//                         if (value!.isEmpty) {
//                           return "Password cannot be empty";
//                         }
//                         if (!regex.hasMatch(value)) {
//                           return ("please enter valid password min. 6 character");
//                         } else {
//                           return null;
//                         }
//                       },
//                       onSaved: (value) {
//                         passwordController.text = value!;
//                       },
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                   ),
//                   SizedBox(height: 5.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       TextButton(
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
//                           child: Text(
//                             'Forget Password?',
//                             style: TextStyle(color: Colors.black, fontSize: 15),
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ForgotScreen()),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         visible = true;
//                       });
//                       signIn(emailController.text, passwordController.text);
//                     },
//                     child: Text(
//                       "Sign In",
//                       style: GoogleFonts.lora(
//                           fontSize: 19.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: Color.fromARGB(255, 108, 46, 223),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       fixedSize: Size(350, 55),
//                       elevation: 10,
//                       shadowColor: Color.fromARGB(255, 108, 46, 223),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Center(
//                     child: Text(
//                       "Or Sign Up With",
//                       style: TextStyle(
//                           fontSize: 17.0,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         SignInButton(
//                           Buttons.LinkedIn,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           mini: true,
//                           onPressed: () {},
//                         ),
//                         SignInButton(
//                           Buttons.Facebook,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           mini: true,
//                           onPressed: () {},
//                         ),
//                         SignInButton(
//                           Buttons.Twitter,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           mini: true,
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


////

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
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
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
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
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
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
                              controller: passwordController,
                              obscureText: _isObscure3,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscure3
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure3 = !_isObscure3;
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
                              onSaved: (value) {
                                passwordController.text = value!;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Text(
                                  'Forget Password?',
                                  style: TextStyle(color: Colors.black, fontSize: 15),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotScreen()),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visible = true;
                            });
                            signIn(
                                emailController.text, passwordController.text);
                          },
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.lora(
                                fontSize: 19.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 108, 46, 223),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            fixedSize: Size(350, 55),
                            elevation: 10,
                            shadowColor: Color.fromARGB(255, 108, 46, 223),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "Or Sign Up With",
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: Row(
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

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "Doctor") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorHomePage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => home(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}

