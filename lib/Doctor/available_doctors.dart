// import 'package:flutter/material.dart';
// import 'package:flutterapp/primary/AvilableDoctors/doctorInfo.dart';
//
// class AvailableDoctors extends StatelessWidget {
//   const AvailableDoctors({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(primarySwatch: Colors.green),
//         debugShowCheckedModeBanner: false,
//         home: const ListViewBuilder());
//   }
// }

// class ListViewBuilder extends StatelessWidget {
//   const ListViewBuilder({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.indigo[900],
//           title: Image.asset('assets/logo.jpg', height: 36)),
//       body: ListView.builder(
//         shrinkWrap: true,
//         itemCount: 10,
//         itemBuilder: ((context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 10, left: 10),
//             child: Card(
//               color: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(1),
//               ),
//               elevation: 0,
//               child: Row(
//                 children: <Widget>[
//                   Image.asset(
//                     "assets/nurse.webp",
//                     height: 100,
//                     width: 100,
//                     fit: BoxFit.cover,
//                   ),
//                   SizedBox(width: 150,),
//                   Align(
//                     alignment: Alignment(-10, 0.9),
//                     child: ElevatedButton(
//                       style:ElevatedButton.styleFrom(
//                         primary: Colors.indigo[700],
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => DoctorInfo()),
//                         );
//                       },
//                       child: Text("Join Now"),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

///
///

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Doctor/appointment.dart';
import 'package:flutterapp/User/user_slot_booking.dart';
import 'package:flutterapp/models/profile.dart';
import 'package:flutterapp/slot%20booking/book_slot.dart';

class AvailableDoctors extends StatefulWidget {
  @override
  _AvailableDoctorsState createState() => _AvailableDoctorsState();
}

class _AvailableDoctorsState extends State<AvailableDoctors> {
  late Stream<QuerySnapshot> _usersStream;

  @override
  void initState() {
    super.initState();
    _usersStream = FirebaseFirestore.instance
        .collection('users')
        .where('role', isNotEqualTo: 'User')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Image.asset('assets/logo.jpg', height: 36),
          flexibleSpace: _appBar()),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final users = snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              final user = users[index].data() as Map<String, dynamic>;
              final email = user['email'] as String;
              final name = user['name'] as String;

              return Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: ListTile(
                  leading: Image.asset(
                    "assets/nurse.webp",
                    height: 100,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                  title: Text(name),
                  subtitle: Text(email),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo[700],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserSlotBooking(),
                        ),
                      );
                    },
                    child: Text("Book slot"),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _appBar() {
    return InkWell(
      child: Row(
        children: [

          SizedBox(width: 320),
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: IconButton(
              iconSize: 25,
              icon: const Icon(Icons.book_outlined, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Appointments(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
