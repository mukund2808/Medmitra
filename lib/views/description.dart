import 'dart:async';
import 'dart:io';

//import 'package:app/constants.dart';
//import 'package:app/controllers/scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medmitra/views/call.dart';
import 'package:medmitra/views/homepage.dart';
import 'package:medmitra/views/options.dart';
import 'package:number_selector/number_selector.dart';
//import 'package:number_selector/number_selector.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'constants.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
   @override
  void initState() {
    Timer(Duration(seconds: 12), () {Navigator.push(context, MaterialPageRoute(builder: (context)=>CalenderDesc())) ;});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
class CalenderDesc extends StatefulWidget {
  static const List<String> selections = <String>[
    'Everyday',
    'Alternate days',
 
  ];
  CalenderDesc({super.key});

  @override
  State<CalenderDesc> createState() => _CalenderDescState();
}


class _CalenderDescState extends State<CalenderDesc> {
 
  int? groupValue;

  //String imagePath;
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Select timings"),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        width: 318.w,
        height: 339.h,
        child: Column(
          children: [
            CheckboxListTile(
                title: Text(
                  "Before Breakfast",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {}),
            CheckboxListTile(
                title: Text(
                  "Before Lunch",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {}),
            CheckboxListTile(
                title: Text(
                  "Before Dinner",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {}),
            const Divider(
              thickness: 2,
            ),
            CheckboxListTile(
                title: Text(
                  "After Breakfast",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {}),
            CheckboxListTile(
                title: Text(
                  "After Lunch",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {}),
            CheckboxListTile(
                title: Text(
                  "After Dinner",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                value: true,
                onChanged: (bool) {})
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        leading: Icon(
          PhosphorIcons.regular.caretLeft,
          color: Colors.black,
          size: 32.0,
        ),
        title: const Text(
          "Schedule Medicines",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        //future: ScannerService().upload(File(imagePath)),
        builder: (context, data) {
          if (data.hasData) {
            return const Text('error 404');
          } else if (data.hasError) {
            return Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CupertinoActivityIndicator(), Text('Loading')],
            ));
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 29.h),
                  child: NumberSelector(
                    current: 9,
                    onUpdate: (number) {},
                    borderRadius: 20,
                    hasCenteredText: true,
                    min: 0,
                    showMinMax: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Radio(
                          toggleable: true,
                            value: "radio value",
                            groupValue: "group value",
                            onChanged: (value) {
                           
                            }),
                      ),
                      Text(
                        "Everyday",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Radio(
                            value: "radio value",
                            groupValue: "group value",
                            onChanged: (wi) {
                             
                            }),
                      ),
                      Text(
                        "Alternate days",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F4FE),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(326.w, 44.h), 
                    elevation: 0//////// HERE
                  ),
                  
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: Text(
                    'Select Timings',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                        fontSize: 15.sp, color: const Color(0xFF3B63DA)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 19.h),
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 17.0.w, right: 165.w, top: 12.h),
                  child: Text(
                    "About my medicine",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 40.0.w, right: 35.w, top: 8.h),
                      child: Text(
                        "Augmentin 625",
                        style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            color: const Color(0xFF3B63DA),
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 38.0.w, right: 45.w, top: 8.h),
                      child: Text(
                        
                        " Amoxycillin Trihydrade IP\n Amoxycillin 500mg\n Clavulanic Acid 125 mg\n Potassium Clavulnate Diluted IP",
                        
                        style: GoogleFonts.poppins(fontSize: 15.sp),
                        maxLines: 4,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0.w, top: 20.h),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 2.w),
                          child: Container(
                            height: 38.h,
                            width: 117.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                "Bacterial Infection",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    color: const Color(0xFF3B63DA)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF1F4FE),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 2.w),
                          child: Container(
                            height: 38.h,
                            width: 117.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                "Liver",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    color: const Color(0xFF3B63DA)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF1F4FE),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                               Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20),
                          child: Container(
                            height: 38.h,
                            width: 117.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                "Kidney",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    color: const Color(0xFF3B63DA)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF1F4FE),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0.h),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B63DA),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(320.w, 44.h), //////// HERE
                    ),
                    onPressed: () {
                      showAlertDialog(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainMenu(),
                          ));
                    },
                    child: Text(
                      'Schedule Now',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                )
              ]),
            );
          }
        },
      ),
    );
  }
}
