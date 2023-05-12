import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/auth/signInScreen.dart';
import 'package:flutterapp/auth/signUp.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(240, 198,186,212),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Looking',
                  style: GoogleFonts.lora(
                      fontSize: 26.0,
                      color: Color.fromARGB(255, 108, 46, 223),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'For Medical Consultant?',
                  style: GoogleFonts.lora(
                      fontSize: 26.0,
                      color: Color.fromARGB(255, 108, 46, 223),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Let us help you',
                  style: GoogleFonts.lora(
                      fontSize: 19.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 120.h,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      "Create a account",
                      style: GoogleFonts.lora(
                          fontSize: 20.0,
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
                      // backgroundColor: Colors.white,
                    ),),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 108, 46, 223),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fixedSize: Size(350, 55),
                      backgroundColor: Colors.white),
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.lora(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 108, 46, 223),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
