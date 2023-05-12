import 'package:flutter/material.dart';
import 'package:flutterapp/api/apis.dart';
import 'package:flutterapp/chatfeatures/screens/profile_screen.dart';
import 'DoctorProfile.dart';
import 'DoctorChatScreens/doctor_chat_home.dart';

class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Image.asset('assets/logo.jpg', height: 36)),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
              elevation: 0,
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      primary: Colors.indigo[700],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen(user: APIs.me)
                            // DoctorProfile(),
                        ),
                      );
                    },
                    child: Text("Profile"),
                  ),
                  SizedBox(width: 180,),
                  Align(
                    alignment: Alignment(-10, 0.9),
                    child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        primary: Colors.indigo[700],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DoctorChatHomeScreen()),
                              // Appointment()),
                        );
                      },
                      child: Text("Appointment"),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}