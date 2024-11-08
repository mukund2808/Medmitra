import 'package:flutter/material.dart';
import 'package:video_call/vc_mainstart.dart';

class Joincall extends StatelessWidget {
  const Joincall({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: Center(
            child: ElevatedButton(
              child: Text("Join call"),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyCall(callID: "1 ")),
                )
              },
            ),
          ),
        ),
      ),
    );
  }
}
