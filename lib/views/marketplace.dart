import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medmitra/views/scanner.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        centerTitle: false,
        backgroundColor: Color(0XFFF1F4FE),
        title: Text(
          "Medicine Management",
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(fontSize: 18.sp, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [SearchBar1(), Padding(
          padding: const EdgeInsets.only(right:100,bottom: 10),
          child: Text(
              "Your scheduled medicines",
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(fontSize: 16.sp, color: Colors.black,fontWeight: FontWeight.w600),
            ),
        ),SvgPicture.asset("assets/icons/med12.svg"),Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [PhosphorIcon(PhosphorIcons.regular.clockCountdown ),Text(
              "Your next medicine in",
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.black),
            ),Text(
              "2:36",
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.black),
            )]),height: 42.h,width:342.w,decoration: BoxDecoration(color: Color(0xfff1f4fe),borderRadius: BorderRadius.circular(8),)),
        ),Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: SvgPicture.asset("assets/icons/first_part.svg",width: 320.w,),
                  ),Padding(
          padding: const EdgeInsets.only(right:140,bottom: 5,top: 25),
          child: Text(
              "Have a prescription ?",
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(fontSize: 16.sp, color: Colors.black,fontWeight: FontWeight.w600),
            ),
        ),Padding(
                    padding: EdgeInsets.only(top: 12.0.h),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3B63DA),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        minimumSize: Size(320.w, 44.h), //////// HERE
                      ),
                      onPressed: () {
                        
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => //ScannerPage(camera: null,),
                        //     ));
                      },
                      child: Text(
                        'Upload prescription',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.only(top: 20,left: 40),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right:10.0),
                          child: SvgPicture.asset("assets/icons/ICON.svg"),
                        ),
                        Text("Your Attached Prescription will be secure\nand Private.")
                      ],
                    ),
                  ),Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SvgPicture.asset("assets/icons/add.svg"),
                  ),Padding(
                    padding: const EdgeInsets.only(right:140.0,top: 15),
                    child: Text(
                                "Popular categories",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(fontSize: 16.sp, color: Colors.black,fontWeight: FontWeight.w600),
                              ),
                  ),Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20),
                    child: SvgPicture.asset("assets/icons/Categories.svg"),
                  ),],),
      ),
    );
  }
}
class SearchBar1 extends StatelessWidget {
  const SearchBar1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.sp),
      child: SizedBox(
        height: 40.h,
        child: TextField(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30.0.sp),
              ),
              hintText: "Doctors, services, medicines...",
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 188, 184, 184),fontSize: 16),
              filled: true,
              prefixIcon: Icon(
                PhosphorIcons.bold.magnifyingGlass,
                size: 24.0.sp,
                color: const Color.fromARGB(255, 147, 147, 147),
              )),
        ),
      ),
    );
  }
}
