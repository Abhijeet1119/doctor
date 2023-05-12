import 'package:flutterapp/primary/AvilableDoctors/AllAvilable.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
String? codeDialog;
String? valueText;
final TextEditingController _textFieldController = TextEditingController();
Future<void> ConsultPopup(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Text(
                      'Consult with a Doctor',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('Tell us your symptom or health problem'),
                  Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Eg. fever ",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10,bottom: 10,right: 60),
                    child: Text(
                      'Enter your phone number',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  )
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
                child: Text("Submit"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllAvilableDoctors()),
                  );
                })
          ],
        );
      });
}