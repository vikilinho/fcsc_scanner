import 'package:flutter/material.dart';
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
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(message,
              style: GoogleFonts.mulish(
                fontSize: 20.0,
                color: Colors.white,
              )),
        ),
      ]),
    );
  }
}
