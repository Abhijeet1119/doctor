import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/auth/changePassword.dart';
import 'package:flutterapp/auth/otpscreen.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
                        SizedBox(
                          height: 40.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Forgot Password",
                            style: GoogleFonts.lora(
                                fontSize: 24.0,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 20, bottom: 20),
                          child: Text(
                            'Please enter your email address. \nyou will receive a link to create new password via email',
                            style: GoogleFonts.lora(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(
                                Icons.check_circle_outline,
                                color: Colors.black,
                                size: 20,
                              ),
                              labelText: 'Email',
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
                          height: 30.h,
                        ),
                        SizedBox(
                          height: 55,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => otpv()),
                                );
                              },
                              child: Text(
                                'Submit',
                                style: GoogleFonts.lora(
                                    fontSize: 18.0,
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
