// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../models/profile.dart';
//
// void signUp(String name, String email, String password, String rool) async {
//   CircularProgressIndicator();
//   if (_formkey.currentState!.validate()) {
//     await _auth
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then((value) => {postDetailsToFirestore(name, email, rool)})
//         .catchError((e) {});
//   }
// }
//
// postDetailsToFirestore(String name, String email, String rool) async {
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   var user = _auth.currentUser;
//   CollectionReference ref = FirebaseFirestore.instance.collection('users');
//   final time = DateTime.now().millisecondsSinceEpoch.toString();
//   final chatUser = ChatUser(
//       id: user!.uid,
//       name: nameControler.text,
//       email: emailController.text,
//       about: rool,
//       // image: user.photoURL.toString(),
//       createdAt: time,
//       isOnline: false,
//       lastActive: time,
//       pushToken: ''
//   );
//
//   ref.doc(user!.uid).set(chatUser.toJson());
//   Navigator.pushReplacement(
//       context, MaterialPageRoute(builder: (context) => home()));
// }