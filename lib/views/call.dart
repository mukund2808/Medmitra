// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class CallUI extends StatefulWidget {
//   const CallUI({Key? key}) : super(key: key);

//   @override
//   State<CallUI> createState() => _CallUIState();
// }

// class _CallUIState extends State<CallUI> {
//   final AgoraClient client = AgoraClient(
//     agoraConnectionData: AgoraConnectionData(
//       appId: "58fbc000e37e4f2b8a64ef028aaebe59",
//       channelName: "test",
//       username: "user1",
//     ),
//   );

//   @override
//   void initState() {
//     super.initState();
//     initAgora();
//   }

//   void initAgora() async {
//     await client.initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Agora VideoUIKit'),
//           centerTitle: true,
//         ),
//         body: SafeArea(
//           child: Stack(
//             children: [
//               AgoraVideoViewer(
//                 client: client,
//                 layoutType: Layout.floating,
//                 enableHostControls: true, // Add this to enable host controls
//               ),
//               AgoraVideoButtons(
//                 client: client,
//                 addScreenSharing: false, // Add this to enable screen sharing
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }