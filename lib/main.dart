import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medmitra/views/call.dart';
import 'package:medmitra/views/marketplace.dart';
import 'package:medmitra/views/onborad/on_board.dart';
import 'package:medmitra/views/doctor_search.dart';
import 'package:medmitra/views/homepage.dart';
import 'package:medmitra/views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
//

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: OnBoardPage(),
          );
        });
  }
}
