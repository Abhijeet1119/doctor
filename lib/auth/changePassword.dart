import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/auth/signInScreen.dart';
import 'package:flutterapp/User/home.dart';
import 'package:flutterapp/splashScreen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/authimg.jpg"),
                fit: BoxFit.cover,
              )
          ),
          child: SingleChildScrollView(
              child: SafeArea(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 85, top: 35, bottom: 10),
                            child: Text(
                              "Change Password",
                              style: GoogleFonts.lora(
                                  fontSize: 24.0,
                                  color: Color.fromARGB(255, 44, 28, 187),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),

                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Enter your new Password',
                            style: GoogleFonts.lora(
                                fontSize: 19.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                labelText: 'Current Password',
                                labelStyle: GoogleFonts.montserrat(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                labelText: 'New Password',
                                labelStyle: GoogleFonts.montserrat(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 55,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()),
                                  );
                                },
                                child: Text(
                                  'Change',
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
                                )),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
        ));
  }
}
