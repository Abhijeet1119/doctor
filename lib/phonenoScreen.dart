import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/auth/otpscreen.dart';
import 'package:flutterapp/secondScreen.dart';
import 'package:flutterapp/auth/auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutterapp/splashScreen.dart';

class PhoneNoScreen extends StatefulWidget {
  const PhoneNoScreen({super.key});

  @override
  State<PhoneNoScreen> createState() => _PhoneNoScreenState();
}

class _PhoneNoScreenState extends State<PhoneNoScreen> {
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'IN');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/cloud.jpg"),
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
                          padding: const EdgeInsets.only(left: 80.0, top: 40, bottom: 20),
                          child: Text(
                            "Verify Phone Number",
                            style: GoogleFonts.lora(
                                fontSize: 15.0,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'We have sent you a SMS with a code to\nnumber 91 9876543210',
                          style: GoogleFonts.lora(
                              fontSize: 13.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        SizedBox(
                          height: 60,
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              phoneNumber = number;
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              setSelectorButtonAsPrefixIcon: true,
                              leadingPadding: 10,
                              useEmoji: true,
                            ),
                            initialValue: phoneNumber,
                            countries: ['US', 'CA', 'MX', 'GB', 'FR', 'DE', 'IT'],
                            onInputValidated: (bool value) {},
                            textStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                            inputDecoration: InputDecoration(
                              hintText: '9876543210',
                              filled: true,
                              // fillColor: Colors.white.withOpacity(0.1),
                              fillColor: Colors.white,
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
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => otpv()),
                                );
                              },
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.lora(
                                    fontSize: 15.0,
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
        ),);
  }
}
