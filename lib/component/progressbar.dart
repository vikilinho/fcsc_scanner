import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProgressBar extends StatelessWidget {
  String message;
  ProgressBar({required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Duration(seconds: 60),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4c12ab)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(message,
              style: GoogleFonts.mulish(
                fontSize: 12.sp,
                color: Colors.white,
              )),
        ),
      ]),
    );
  }
}
