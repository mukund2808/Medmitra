import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Labchips extends StatelessWidget {
  final String firstline;
  final String secondline;
  const Labchips({super.key, required this.firstline, required this.secondline});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [Padding(
        padding: const EdgeInsets.only(left:10.0),
        child: SvgPicture.asset("assets/icons/testtube.svg"),
      ),Padding(
        padding: const EdgeInsets.only(top:20.0),
        child: Column(children: [Text(firstline,style: GoogleFonts.poppins(fontSize: 13.sp,fontWeight: FontWeight.w500),),Text(secondline,style: GoogleFonts.poppins(fontSize: 13.sp,fontWeight: FontWeight.w500))],),
      )],),
      height: 74.h,
      width: 169.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color:Color(0xffd3e0ff) )),
    );
  }
}
