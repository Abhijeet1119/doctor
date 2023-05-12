import 'package:flutter/material.dart';
import 'package:flutterapp/primary/AvilableDoctors/doctorInfo.dart';

class AllAvilableDoctors extends StatelessWidget {
  const AllAvilableDoctors({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: const ListViewBuilder());
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Image.asset('assets/logo.jpg', height: 36)),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
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
                  Image.asset(
                    "assets/nurse.webp",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 150,),
                  Align(
                    alignment: Alignment(-10, 0.9),
                    child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        primary: Colors.indigo[700],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DoctorInfo()),
                        );
                      },
                      child: Text("Book Slot"),
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