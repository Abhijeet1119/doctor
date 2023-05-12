import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';


class DoctorInfo extends StatelessWidget {


  List<Color> colors = [Colors.blue, Colors.green, Colors.yellow, Colors.pink];

  var selectedColor = Colors.blue;

  var isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[50],
        body: SafeArea(
          child: Column(
            children: [
              header(),
              Expanded(child: section()),
            ],
          ),
        ));
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/surgion.webp"),
        ],
      ),
    );
  }

  Widget section() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            "I'm Dr. Sneha, and it's OK for you to call me sneha if you like. "
                "\nI am here to help you" ,
            textAlign: TextAlign.justify,
            style:
            TextStyle(color: AppColor.bodyColor, fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Call Now",
              style: GoogleFonts.lora(
                  fontSize: 19.0,
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
            ),),
        ],
      ),
    );
  }
}