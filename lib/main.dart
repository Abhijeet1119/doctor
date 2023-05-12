import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}




// class VideoCallScreen extends StatefulWidget {
//   const VideoCallScreen({Key? key}) : super(key: key);
//   @override
//   State<VideoCallScreen> createState() => _VideoCallScreenState();
// }
//
// class _VideoCallScreenState extends State<VideoCallScreen> {
//   final AgoraClient _client = AgoraClient(
//     agoraConnectionData: AgoraConnectionData(
//       appId: 'f6e0e326f647415d9ff08adfd46c5cac',
//       channelName: 'test',
//       tempToken: '1234',
//     ),
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//   }
//
//   Future<void> _initAgora() async {
//     await _client.initialize();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Video Call'),
//           ),
//           body: SafeArea(
//             child: Stack(
//               children: [
//                 AgoraVideoViewer(
//                   client: _client,
//                   layoutType: Layout.floating,
//                   showNumberOfUsers: true,
//                 ),
//                 AgoraVideoButtons(
//                   client: _client,
//                   enabledButtons: const [
//                     BuiltInButtons.toggleCamera,
//                     BuiltInButtons.switchCamera,
//                     BuiltInButtons.callEnd,
//                     BuiltInButtons.toggleMic,
//                   ],
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }

