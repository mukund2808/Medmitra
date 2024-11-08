import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class MyCall extends StatelessWidget {
  const MyCall({super.key, required this.callID});
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID: 1227680112,
        appSign:
            "bc91b2792b06a7771e255a192a44ea75fb0c5685cb0b0b0fa21b8193d2a97487",
        userID: "Doctor1",
        userName: "Doctor",
        callID: callID,

        // Modify your custom configurations here.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) => Navigator.of(context).pop());
  }
}
