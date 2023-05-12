import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/auth/signInScreen.dart';
import 'package:flutterapp/auth/auth.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _step = 0;
  // int _stepss=0;
  List<String> _steps = [
    'Consult top doctors online for any health concern',
    'Book an appointment for an in-clinic consultation',
  ];

  List<String> _stepss = [
    'Private online consultations with verified doctors in all \nspecialists',
    "Find experienced doctors \nacross all specialties",
  ];

  void _nextStep() {
    setState(() {
      if (_step < 1) {
        _step++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,245,245,245),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage("assets/appintro.jpg"),
            fit: BoxFit.fitWidth,
          ),
        ),
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
                    height: 200.h,
                  ),
                  Expanded(
                      child: Text(
                        _steps[_step],
                        style: GoogleFonts.montserrat(
                          fontSize: 23.0,
                          color: Colors.purpleAccent.shade200,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                  ),
                  Expanded(
                    child: Text(
                      _stepss[_step],
                      style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50,bottom: 20),
                        child: Row(
                          children: [
                            TextButton(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent.shade700,
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AuthScreen(),
                                  ),
                                );
                              },
                            ),
                            Spacer(),
                            ElevatedButton(
                              onPressed: _nextStep,
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurpleAccent.shade700,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                fixedSize: Size(100, 50),
                                elevation: 12,
                                shadowColor: Colors.purpleAccent.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
