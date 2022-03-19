import 'dart:convert';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:canvas/Canvas.dart';
import 'package:canvas/DioAPi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Canvas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Dio_try(),
    );
  }
}

// class Call extends StatefulWidget {
//   @override
//   State<Call> createState() => _CallState();
// }

// class _CallState extends State<Call> {
//   final AgoraClient client = AgoraClient(
//   agoraConnectionData: AgoraConnectionData(
//     appId: "643b67d06b3740f9b7a36f4ec1150b36",
//     channelName: "test",
//   ),
  
//   enabledPermission: [
//     Permission.camera,
//     Permission.microphone,
//   ],
// );

// @override
// void initState() {
//   super.initState();
//   initAgora();
//   print("test1");
// }

// void initAgora() async {
//   await client.initialize();
// }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             AgoraVideoViewer(client: client), 
//             AgoraVideoButtons(client: client),
//           ],
//         ),
//       ),
//   );
//   }
// }
