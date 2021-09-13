import 'package:fcsc_admin/models/validation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCardComponent extends StatelessWidget {
  final Validation validation;
  NewCardComponent({required this.validation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  color: Colors.black12),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.8,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 8.0, bottom: 8.0),
                      child: Text(
                        validation.firstName +
                            validation.middleName +
                            validation.lastName,
                        style: GoogleFonts.lato(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.green,
                      backgroundImage: AssetImage('images/nerc_logo.png'),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 8.0, bottom: 12.0),
                        child: Text(
                          "Exam ID Card",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                      child: Text(
                        "Exam No:",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      validation.serialNo,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            NetworkImage(validation.applicantPassportURL),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.transparent),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height / 2,
                    width: 370,
                    child: Column(children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(validation.qrCodeURL),
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Only Valid For 1 Exam",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.copyright, color: Colors.black, size: 14),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "2021 Testmi",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
