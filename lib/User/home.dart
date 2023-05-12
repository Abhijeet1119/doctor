import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterapp/Doctor/available_doctors.dart';
import 'package:flutterapp/User/UserChatScreen/user_chat_home.dart';
import 'package:flutterapp/primary/video_consultant.dart';
import 'package:flutterapp/slider.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../Doctor/DoctorRegistration/DoctorSignUp.dart';
import '../Doctor/DoctorChatScreens/doctor_chat_screen.dart';
import '../auth/SignINScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

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
  "COUGH, COLD, \n     FEVER",
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

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final controller = FloatingSearchBarController();

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = min(value, 2);
    _index == 2 ? controller.hide() : controller.show();
    setState(() {});
  }

  Stream<QuerySnapshot> getUsersStream(String searchTerm) {
    var collection = FirebaseFirestore.instance.collection('users');
    if (searchTerm != null && searchTerm.isNotEmpty) {
      return collection
          .where('name', isGreaterThanOrEqualTo: searchTerm)
          .where('name', isLessThan: searchTerm + 'z')
          .snapshots();
    } else {
      return collection.snapshots();
    }
  }

  String _searchTerm = '';
  // double sbht=40;
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //     Stack(
          //   fit: StackFit.expand,
          //   children: [
          //     SingleChildScrollView(
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 15),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             SizedBox(
          //               height: 100,
          //             ),
          //             const SizedBox(
          //               // height: 60,
          //               child: BannerSlider(),
          //             ),
          //             // Row(
          //             //   children: [
          //             //     SizedBox(
          //             //       height: 100,
          //             //       width: MediaQuery.of(context).size.width * 0.7,
          //             //       child: Card(
          //             //         elevation: 4,
          //             //         child: Column(
          //             //           // children: [
          //             //           //   TextFormField(
          //             //           //     decoration: InputDecoration(
          //             //           //         suffixIcon: Icon(
          //             //           //           Icons.add_circle_sharp,
          //             //           //           color: Colors.grey.shade200,
          //             //           //         ),
          //             //           //         prefixIcon: Icon(
          //             //           //           Icons.search,
          //             //           //           color: Colors.grey.shade200,
          //             //           //         ),
          //             //           //         hintText: 'Search Doctor/Hopital',
          //             //           //         hintStyle: TextStyle(
          //             //           //             color: Colors.black,
          //             //           //             fontSize: 15,
          //             //           //             // fontFamily: "Lora",
          //             //           //             fontWeight: FontWeight.w400),
          //             //           //         filled: true,
          //             //           //         fillColor: Colors.white.withOpacity(0.5),
          //             //           //         border: InputBorder.none),
          //             //           //     onChanged: (value) {
          //             //           //       setState(() {
          //             //           //         _searchTerm = value.trim();
          //             //           //       });
          //             //           //     },
          //             //           //   ),
          //             //           //   Expanded(
          //             //           //     child: StreamBuilder(
          //             //           //       stream: getUsersStream(_searchTerm),
          //             //           //       builder: (context, snapshot) {
          //             //           //         if (snapshot.hasData) {
          //             //           //           var documents = snapshot.data?.docs;
          //             //           //           return ListView.builder(
          //             //           //             itemCount: documents?.length,
          //             //           //             itemBuilder: (context, index) {
          //             //           //               var document = documents![index];
          //             //           //               return ListTile(
          //             //           //                 title: Text(document['name']),
          //             //           //                 subtitle: Text(document['email']),
          //             //           //                 onTap: () {
          //             //           //                   // handle tap on the user
          //             //           //                 },
          //             //           //               );
          //             //           //             },
          //             //           //           );
          //             //           //         } else {
          //             //           //           return Container();
          //             //           //         }
          //             //           //       },
          //             //           //     ),
          //             //           //   ),
          //             //           // ],
          //             //         ),
          //             //       ),
          //             //     ),
          //             // SizedBox(
          //             //   width: 20,
          //             // ),
          //             // Container(
          //             //   decoration: BoxDecoration(
          //             //     borderRadius: BorderRadius.circular(10),
          //             //     color: Color.fromARGB(255, 17, 2, 155),
          //             //   ),
          //             //   height: 45,
          //             //   width: 45,
          //             //   child: Icon(
          //             //     Icons.search,
          //             //     color: Colors.white,
          //             //     size: 26,
          //             //   ),
          //             // ),
          //             //   ],
          //             // ),
          //             SizedBox(
          //               height: 20,
          //             ),
          //             SizedBox(
          //               height: 240,
          //               child: ListView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 shrinkWrap: true,
          //                 itemCount: services.length,
          //                 itemBuilder: ((context, index) {
          //                   return Padding(
          //                     padding: const EdgeInsets.only(right: 10, left: 10),
          //                     child: InkWell(
          //                       onTap: () {
          //                         Navigator.of(context).push(
          //                           MaterialPageRoute(
          //                             builder: (context) => const VideoConsult(),
          //                           ),
          //                         );
          //                       },
          //                       child: Card(
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(23),
          //                         ),
          //                         elevation: 5,
          //                         child: Column(
          //                           children: <Widget>[
          //                             Image.asset(
          //                               services[index],
          //                               height: 180,
          //                               width: 200,
          //                               fit: BoxFit.cover,
          //                             ),
          //                             Padding(
          //                               padding: const EdgeInsets.only(top: 5),
          //                               child: Text(
          //                                 servicestxt[index],
          //                                 style: TextStyle(
          //                                   fontWeight: FontWeight.bold,
          //                                   fontSize: 15,
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   );
          //                 }),
          //               ),
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             Column(
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.only(right: 25, left: 20),
          //                   child: Text(
          //                     "Consult top doctors online for any health concern",
          //                     style: TextStyle(
          //                         fontSize: 30,
          //                         fontWeight: FontWeight.bold,
          //                         shadows: [
          //                           Shadow(
          //                               color: Colors.black12, offset: Offset(5, 5))
          //                         ]),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.only(top: 10, right: 25, left: 20),
          //                   child: Text(
          //                     "Private online consultations with verified doctors in all specialists",
          //                     style: TextStyle(fontSize: 17),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(
          //               height: 20,
          //             ),
          //             SizedBox(
          //               height: 200,
          //               child: ListView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 shrinkWrap: true,
          //                 itemCount: problem.length,
          //                 itemBuilder: ((context, index) {
          //                   return Padding(
          //                     padding: const EdgeInsets.only(right: 10, left: 10),
          //                     child: Card(
          //                       color: Colors.white,
          //                       shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(1),
          //                       ),
          //                       elevation: 0,
          //                       child: Column(
          //                         children: <Widget>[
          //                           Image.asset(
          //                             problem[index],
          //                             height: 120,
          //                             width: 120,
          //                             fit: BoxFit.cover,
          //                           ),
          //                           Padding(
          //                             padding:
          //                                 const EdgeInsets.only(top: 5, bottom: 0),
          //                             child: Text(
          //                               problemtxt[index],
          //                               style: TextStyle(
          //                                   fontWeight: FontWeight.bold,
          //                                   fontSize: 15),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   );
          //                 }),
          //               ),
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             Column(
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.only(right: 25, left: 20),
          //                   child: Text(
          //                     "Book an appointment for an in-clinic consultation",
          //                     style: TextStyle(
          //                         fontSize: 30,
          //                         fontWeight: FontWeight.bold,
          //                         shadows: [
          //                           Shadow(
          //                               color: Colors.black12, offset: Offset(5, 5))
          //                         ]),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.only(top: 10, right: 25, left: 20),
          //                   child: Text(
          //                     "Find experienced doctors across all specialtie",
          //                     style: TextStyle(fontSize: 17),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             SizedBox(
          //               height: 230,
          //               child: ListView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 physics: const AlwaysScrollableScrollPhysics(),
          //                 shrinkWrap: true,
          //                 itemCount: appointment.length,
          //                 itemBuilder: ((context, index) {
          //                   return Padding(
          //                     padding: const EdgeInsets.only(right: 10, left: 10),
          //                     child: Card(
          //                       color: Colors.white,
          //                       shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(10),
          //                       ),
          //                       elevation: 5,
          //                       child: Column(
          //                         children: <Widget>[
          //                           Image.asset(
          //                             appointment[index],
          //                             height: 150,
          //                             width: 300,
          //                             fit: BoxFit.cover,
          //                           ),
          //                           Padding(
          //                             padding:
          //                                 const EdgeInsets.only(top: 5, bottom: 2),
          //                             child: Text(
          //                               appointmenttxt[index],
          //                               style: TextStyle(
          //                                   fontWeight: FontWeight.bold,
          //                                   fontSize: 15),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   );
          //                 }),
          //               ),
          //             ),
          //             SizedBox(
          //               height: 20,
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //     buildFloatingSearchBar(),
          //   ],
          // )

          ///
          ///
          ///
          Stack(
        children: [
          // buildFloatingSearchBar(),
          SafeArea(
            child: Container(
              width: 200,
              // color: Colors.amberAccent,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.indigo,
                          child: Image(
                            image: AssetImage("assets/logo.jpg"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Hey There"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: Colors.purple[400],
                    elevation: 10,
                    borderRadius: new BorderRadius.circular(20),
                    shadowColor: Colors.black,
                    child: ListTile(
                      leading: Icon(Icons.history_outlined),
                      title: Text('Chat'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserChatHomeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: Colors.purple[400],
                    elevation: 10,
                    borderRadius: new BorderRadius.circular(20),
                    shadowColor: Colors.black,
                    child: ListTile(
                      leading: Icon(Icons.event_available),
                      title: Text('Aviable Doctors'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AvailableDoctors(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: Colors.purple[400],
                    elevation: 10,
                    borderRadius: new BorderRadius.circular(20),
                    shadowColor: Colors.black,
                    child: ListTile(
                      leading: Icon(Icons.perm_contact_cal_outlined),
                      title: Text('See Profile'),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: Colors.purple[400],
                    elevation: 10,
                    borderRadius: new BorderRadius.circular(20),
                    shadowColor: Colors.black,
                    child: ListTile(
                      leading: Icon(Icons.history_outlined),
                      title: Text('History'),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: Colors.purple[400],
                    elevation: 10,
                    borderRadius: new BorderRadius.circular(20),
                    shadowColor: Colors.black,
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Are You a Doctor?'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorSignUp(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: Colors.purple[400],
                    elevation: 10,
                    borderRadius: new BorderRadius.circular(20),
                    shadowColor: Colors.black,
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Log out'),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
            // ? Here Change Animation
            curve: Curves.easeInCubic,
            tween: Tween<double>(begin: 0, end: value),
            // ? and here change
            duration: const Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 8) * val),
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.indigo,
                    leading: GestureDetector(
                      onTap: () {
                        setState(() {
                          value == 0 ? value = 1 : value = 0;
                        });
                      },
                      child: Icon(
                        Icons.menu, // add custom icons also
                      ),
                    ),
                  ),
                  body: Stack(
                    fit: StackFit.expand,
                    children: [
                      // buildFloatingSearchBar(),
                      SafeArea(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                const SizedBox(
                                  // height: 60,
                                  child: BannerSlider(),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Card(
                                        elevation: 4,
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  suffixIcon: Icon(
                                                    Icons.add_circle_sharp,
                                                    color: Colors.grey.shade200,
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: Colors.grey.shade200,
                                                  ),
                                                  hintText:
                                                      'Search Doctor/Hopital',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      // fontFamily: "Lora",
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  filled: true,
                                                  fillColor: Colors.white
                                                      .withOpacity(0.5),
                                                  border: InputBorder.none),
                                              onChanged: (value) {
                                                setState(() {
                                                  _searchTerm = value.trim();
                                                });
                                              },
                                            ),
                                            Expanded(
                                              child: StreamBuilder(
                                                stream:
                                                    getUsersStream(_searchTerm),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    var documents =
                                                        snapshot.data?.docs;
                                                    return ListView.builder(
                                                      itemCount:
                                                          documents?.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        var document =
                                                            documents![index];
                                                        return ListTile(
                                                          title: Text(
                                                              document['name']),
                                                          subtitle: Text(
                                                              document[
                                                                  'email']),
                                                          onTap: () {
                                                            // handle tap on the user
                                                          },
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    return Container();
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
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
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 240,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: services.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const VideoConsult(),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(23),
                                            ),
                                            elevation: 5,
                                            child: Column(
                                              children: <Widget>[
                                                Image.asset(
                                                  services[index],
                                                  height: 180,
                                                  width: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Text(
                                                    servicestxt[index],
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25, left: 20),
                                      child: Text(
                                        "Consult top doctors online for any health concern",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black12,
                                                  offset: Offset(5, 5))
                                            ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 25, left: 20),
                                      child: Text(
                                        "Private online consultations with verified doctors in all specialists",
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
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Card(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(1),
                                          ),
                                          elevation: 0,
                                          child: Column(
                                            children: <Widget>[
                                              Image.asset(
                                                problem[index],
                                                height: 120,
                                                width: 120,
                                                fit: BoxFit.cover,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 0),
                                                child: Text(
                                                  problemtxt[index],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25, left: 20),
                                      child: Text(
                                        "Book an appointment for an in-clinic consultation",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black12,
                                                  offset: Offset(5, 5))
                                            ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 25, left: 20),
                                      child: Text(
                                        "Find experienced doctors across all specialtie",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 230,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: appointment.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Card(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 2),
                                                child: Text(
                                                  appointmenttxt[index],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // buildFloatingSearchBar(),
                    ],
                  ),
                ),
              ));
            },
          ),

          //! Gesture For Slide
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 300),
      onQueryChanged: (query) {
        _searchTerm = query;
        getUsersStream(_searchTerm);
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction.searchToClear(
          showIfClosed: true,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          child: Container(
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                // Colors.accents.map((color) {
                Container(
                  height: 400,
                  child: StreamBuilder(
                    stream: getUsersStream(_searchTerm),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var documents = snapshot.data?.docs;
                        return ListView.builder(
                          itemCount: documents?.length,
                          itemBuilder: (context, index) {
                            var document = documents![index];
                            return ListTile(
                              title: Text(document['name']),
                              subtitle: Text(document['email']),
                              onTap: () {
                                // handle tap on the user
                              },
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
