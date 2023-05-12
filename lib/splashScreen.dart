import 'dart:async';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/User/home.dart';
import 'package:flutterapp/primary/video_consultant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/secondScreen.dart';
import 'auth/signUp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      (() => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  SecondScreen()
                      // VideoConsult(),
                  // home(),
              // DrawerAnimated(),
              // SignupScreen(),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([
          precacheImage(Image.asset('assets/dc.jpg').image, context),
          // precacheImage(Image.asset('assets/logo.webp').image, context),
        ]),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/dc.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.w,
                      // margin: EdgeInsets.only(left: 105, right: 5),
                      color: Colors.transparent,
                      // child: const Image(
                      //   image: AssetImage("assets/logo.webp"),
                      //
                      // ),
                    ),
                    // Text(
                    //   "Doctor",
                    //   style: GoogleFonts.montserrat(fontSize: 50, fontWeight: FontWeight.bold),
                    // ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
