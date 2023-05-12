import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/slider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'consultNowPopUp.dart';


List services = [
  "assets/doctor.webp",
  "assets/nurse.webp",
  "assets/surgion.webp",
  "assets/labtest.png",
];
List<String> servicestxt = [
  "Instant Video \nConsultant",
  'Find Doctor near \nyou',
  'Surgeries',
  'Lab Tests',
];

List problemtxt = [
  "PERIODS",
  "SKIN RELATED ISSUES",
  "COUGH, COLD, \n        FEVER",
  "DEPRESSION or \n      ANXITY"
];

List problem = [
  "assets/periods.webp",
  "assets/skin.webp",
  "assets/cold.webp",
  "assets/depression.webp",
];

List appointment = [
  "assets/dentist.jpg",
  "assets/gynecologist.jpg",
  "assets/dietition.jpg",
  "assets/physiotheperist.jpg",
  "assets/general surgion.jpg",
  "assets/orthopedist.jpg",
  "assets/general physecian.jpg",
];

List appointmenttxt = [
  "Teething trubles? Schedule a dental checkup",
  "Explore for women’s health, pregnancy and \ninfertility treatments",
  "Get guidance on eating right, weight \nmanagement and sports nutrition",
  "Pulled a muscle? Get it treated by a trained \nphysiotherapist",
  "Need to get operated? Find the right surgeon",
  "For Bone and Joints issues, spinal injuries and \nmore",
  "Find the right family doctor in your \nneighborhood"
];


String? codeDialog;
String? valueText;

class VideoConsult extends StatefulWidget {
  const VideoConsult({super.key});

  @override
  State<VideoConsult> createState() => _VideoConsultState();
}

class _VideoConsultState extends State<VideoConsult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 210,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            child: Center(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/videoconsult.png',
                                      height: 200,
                                      width: 350,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(-10,
                                        0.9), // change .2 based on your need
                                    child: ElevatedButton(
                                      onPressed: () {
                                        ConsultPopup(context);
                                      },
                                      child: Text("Consult Now"),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(-10,
                                        -0.5),
                                    child: Text(
                                      "Skip the travel! \nTake Online Doctor \nConsultation",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),Align(
                                    alignment: Alignment(-9,
                                        0.2),
                                    child: Text(
                                      "Private consultation + Audio call \nStarts at just ₹199",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width * .7,
                        child: Card(
                          elevation: 4,
                          child: TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.cancel,
                                  color: Colors.grey.shade200,
                                ),
                                hintText: 'Find Doctor/Clinic/Hospital',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.5),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 17, 2, 155),
                        ),
                        height: 45,
                        width: 45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 26,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120, left: 5),
                        child: Text(
                          "25+ Specialities",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    color: Colors.black12, offset: Offset(5, 5))
                              ]),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 25, left: 20),
                        child: Text(
                          "Consult with top doctors across specialities",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: problem.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                            elevation: 0,
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  problem[index],
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 0),
                                  child: Text(
                                    problemtxt[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 15),
                        child: Text(
                          "Common Health Concerns",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    color: Colors.black12, offset: Offset(5, 5))
                              ]),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 30, left: 10),
                        child: Text(
                          "Consult a doctor online for any health issue",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: appointment.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  appointment[index],
                                  height: 150,
                                  width: 300,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 2),
                                  child: Text(
                                    appointmenttxt[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
