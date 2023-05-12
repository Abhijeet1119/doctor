import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/auth/signInScreen.dart';

class DoctorProfile extends StatelessWidget {
  List<Color> colors = [Colors.blue, Colors.green, Colors.yellow, Colors.pink];
  var selectedColor = Colors.blue;
  var isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[50],
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
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
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70,
                        backgroundImage: AssetImage("assets/surgion.webp"),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.white70,
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.black87,
                                      ),
                                      onPressed: () {})),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Name',
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
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
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
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Phone Number',
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
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                        );
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
                        "Submit",
                        style: GoogleFonts.lora(
                            fontSize: 17.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
