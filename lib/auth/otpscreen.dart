import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/auth/changePassword.dart';
import 'package:flutterapp/User/home.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class otpv extends StatefulWidget {
  @override
  _otpvState createState() => _otpvState();
}

class _otpvState extends State<otpv> {
  String otp = '';
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        'assets/authimg.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topLeft,
            colors: [Colors.transparent, Colors.white.withOpacity(.8)],
          ),
        ),
      ),
      Column(
        children: [
          SizedBox(height: 80.0),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 95, 0),
                    child: Text(
                      'Email Verification',
                      style: GoogleFonts.lora(
                          fontSize: 20.0,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 145, 0),
                  child: Text(
                    'Enter Your OTP here',
                    style: GoogleFonts.lora(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Form(
            key: formKey,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 55),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  obscureText: true,
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: 50.0,
                    fieldWidth: 50.0,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    selectedColor: Colors.white,
                    inactiveColor: Colors.white,
                    activeColor: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePassword()),
                    );
                  },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    return true;
                  },
                )),
          ),

          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 100, 0),
                  child: Text(
                    "Don't recive any code?",
                    style: GoogleFonts.lora(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 135, 0),
            child: TextButton(
              child: Text(
                'Resend a New Code',
                style: GoogleFonts.lora(
                    fontSize: 15.0,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w600),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ]));
  }

  Widget _buildOtpTextField() {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: PinCodeTextField(
        appContext: context,
        length: 1,
        onChanged: (value) {
          setState(() {
            otp += value;
          });
          if (otp.length == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home()),
            );
          }
        },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.circle,
          fieldHeight: 50.0,
          fieldWidth: 50.0,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
          selectedColor: Colors.white,
          inactiveColor: Colors.white,
          activeColor: Colors.white,
        ),
      ),
    );
  }
}
