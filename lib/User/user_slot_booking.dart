import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterapp/api/apis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/profile.dart';
import '../models/message.dart';

class UserSlotBooking extends StatefulWidget {
  @override
  State<UserSlotBooking> createState() => _UserSlotBookingState();
}

class _UserSlotBookingState extends State<UserSlotBooking> {
  static User get user => FirebaseAuth.instance.currentUser!;
  // final ChatUser usr;
  //
  // _UserSlotBookingState(this.usr);
  // final ChatUser usr;
  // const UserSlotBookingState({super.key, required this.usr});
  // final ChatUser user;
  final now = DateTime.now();
  late BookingService bookingservice;

  // _UserSlotBookingState(this.usr);

  @override
  void initState() {
    super.initState();
    bookingservice = BookingService(
      serviceDuration: 30,
      bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
      bookingStart: DateTime(now.year, now.month, now.day, 8, 0),


      userEmail:user.email.toString(),
      userId:user.uid,
      userName:user.displayName.toString(),
      serviceName: 'tester',
    );
  }

  CollectionReference bookings =
      FirebaseFirestore.instance.collection('bookings');

  ///This is how can you get the reference to your data from the collection, and serialize the data with the help of the Firestore [withConverter]. This function would be in your repository.
  CollectionReference<BookingService> getBookingStream() {
    return bookings.withConverter<BookingService>(
      fromFirestore: (snapshots, _) =>
          BookingService.fromJson(snapshots.data()!),
      toFirestore: (snapshots, _) => snapshots.toJson(),
    );
  }

  ///How you actually get the stream of data from Firestore with the help of the previous function
  ///note that this query filters are for my data structure, you need to adjust it to your solution.

  Stream<dynamic>? getBookingStreamFirebase(
      {required DateTime end, required DateTime start}) {
    return getBookingStream().snapshots();
  }

  ///After you fetched the data from firestore, we only need to have a list of datetimes from the bookings:
  List<DateTimeRange> convertStreamResultFirebase(
      {required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    ///Note that this is dynamic, so you need to know what properties are available on your result, in our case the [SportBooking] has bookingStart and bookingEnd property
    List<DateTimeRange> converted = [];
    for (var i = 0; i < streamResult.size; i++) {
      final item = streamResult.docs[i].data();
      converted.add(
        DateTimeRange(
          start: (item.bookingStart!),
          end: (item.bookingEnd!),
        ),
      );
    }
    return converted;
  }

  ///This is how you upload data to Firestore
  Future<dynamic> uploadBookingFirebase(
      {required BookingService newBooking}) async {
    await bookings
        .add(newBooking.toJson())
        .then((value) => print("Booking Added"))
        .catchError((error) => print("Failed to add booking: $error"));
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Your Slot',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Book Your Slot'),
        ),
        body: Center(
          child: BookingCalendar(
            bookingService: bookingservice,
            convertStreamResultToDateTimeRanges: convertStreamResultFirebase,
            getBookingStream: getBookingStreamFirebase,
            uploadBooking: uploadBookingFirebase,
            uploadingWidget: const CircularProgressIndicator(),
            pauseSlots: generatePauseSlots(),
            pauseSlotText: 'LUNCH',
            hideBreakTime: false,
            loadingWidget: const Text('Fetching data...'),
            // locale: 'EN',
            startingDayOfWeek: StartingDayOfWeek.sunday,
            wholeDayIsBookedWidget:
                const Text('Sorry, for this day everything is booked'),
          ),
        ),
      ),
    );
  }
}
