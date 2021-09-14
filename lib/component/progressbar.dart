import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
