import 'dart:convert';

import 'package:fcsc_admin/component/constants.dart';
import 'package:fcsc_admin/component/ixam_card.dart';
import 'package:fcsc_admin/component/progressbar.dart';
import 'package:fcsc_admin/models/new_validator.dart';
import 'package:fcsc_admin/views/RevampPage/home.dart';
import 'package:fcsc_admin/models/validator.dart';
import 'package:fcsc_admin/views/user_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewValidationScreen extends StatefulWidget {
  @override
  _NewValidationScreenState createState() => _NewValidationScreenState();
}

class _NewValidationScreenState extends State<NewValidationScreen> {
  // var output = "";
  String? controlNumber = "";
  String newValue = "";

  TextEditingController _examController = TextEditingController();
  var examNo;

  Future<void> scanQRCode() async {
    // String controlNumber;
    try {
      controlNumber = await FlutterBarcodeScanner.scanBarcode(
        '#ff38AA5F',
        'Cancel',
        true,
        ScanMode.QR,
      ).then((value) {
        setState(() {
          newValue = value;
          if (newValue != "-1") {
            // scanCard();
            Get.to(UserCard());
          }
        });
      });
    } on PlatformException {
      controlNumber = 'Failed to get platform version.';
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Welcome Back!",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              CircleAvatar(
                radius: 85,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('images/1024.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                    onPressed: () async {
                      scanQRCode();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Scan Exam Card',
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            )),
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Or",
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Enter Candidate Exam Number",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                        onChanged: (value) {
                          examNo = value;
                        },
                        controller: _examController,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "ywsq2656",
                          hintStyle: GoogleFonts.lato(
                            fontSize: 14,
                          ),
                        )),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black12,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                    onPressed: () async {
                      validateNumber();
                      Get.to(UserCard());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Validate',
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            )),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () async {
                          Get.to(HomeScreen());
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.remove('pass');
                        },
                        child: Text("Log Out")),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  //The method for validating the card... once user scan the card
  Future<NewValidator> scanCard() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ProgressBar(
            message: "Validating candidate...",
          );
        });
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('pass');
    var endpoint = Uri.parse('$BASE_URL/Candidates/ControlNo/$newValue');
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(endpoint, headers: headers);
    Navigator.pop(context);
    switch (response.statusCode) {
      case 200:
        var mybody = NewValidator.fromJson(jsonDecode(response.body));
        print(response.statusCode);

        // Get.defaultDialog(
        //     title: "",
        //     content: Column(
        //       children: [
        //         SizedBox(
        //           height: 30,
        //         ),
        //         Center(
        //           child: Padding(
        //             padding: const EdgeInsets.all(12.0),
        //             child: Container(
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(20),
        //                   border: Border.all(color: Colors.black),
        //                   color: Colors.black12),
        //               height: MediaQuery.of(context).size.height * 0.7,
        //               width: MediaQuery.of(context).size.width * 0.8,
        //               child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [
        //                     Row(
        //                       children: [
        //                         Container(
        //                           padding: EdgeInsets.only(top: 5, left: 5),
        //                           decoration: BoxDecoration(
        //                             border: Border.all(color: Colors.white),
        //                             shape: BoxShape.circle,
        //                           ),
        //                           child: CircleAvatar(
        //                             backgroundColor: Colors.transparent,
        //                             backgroundImage:
        //                                 AssetImage('images/logo.png'),
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                     Row(
        //                       children: [
        //                         Padding(
        //                             padding: const EdgeInsets.only(
        //                                 left: 12.0, right: 12.0, bottom: 12.0),
        //                             child: Text(
        //                               "Exam ID Card",
        //                               style: GoogleFonts.lato(
        //                                 fontSize: 14,
        //                                 fontWeight: FontWeight.w600,
        //                                 color: Colors.black,
        //                               ),
        //                             ))
        //                       ],
        //                     ),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.center,
        //                       children: [
        //                         CircleAvatar(
        //                           radius: 70,
        //                           backgroundColor: Colors.transparent,
        //                           backgroundImage:
        //                               NetworkImage(mybody.objectValue.picture),
        //                         )
        //                       ],
        //                     ),
        //                     Expanded(
        //                       child: Container(
        //                         decoration: BoxDecoration(
        //                             borderRadius: BorderRadius.circular(20),
        //                             border:
        //                                 Border.all(color: Colors.transparent),
        //                             color: Colors.white),
        //                         height: MediaQuery.of(context).size.height / 2,
        //                         width: 370,
        //                         child: Column(children: [
        //                           Padding(
        //                             padding: const EdgeInsets.only(
        //                                 top: 8.0, bottom: 8.0),
        //                             child: Text(
        //                               mybody.objectValue.firstName +
        //                                   " " +
        //                                   mybody.objectValue.lastName,
        //                               style: GoogleFonts.lato(
        //                                 fontSize: 20,
        //                                 fontWeight: FontWeight.w600,
        //                               ),
        //                             ),
        //                           ),
        //                           Row(
        //                             children: [
        //                               Padding(
        //                                 padding: const EdgeInsets.only(
        //                                     left: 8.0, right: 5.0),
        //                                 child: Text(
        //                                   "Exam No:",
        //                                   style: GoogleFonts.lato(
        //                                     fontSize: 14,
        //                                     fontWeight: FontWeight.w600,
        //                                   ),
        //                                 ),
        //                               ),
        //                               Text(
        //                                 mybody.objectValue.examNo,
        //                                 style: GoogleFonts.lato(
        //                                   fontSize: 13,
        //                                   fontWeight: FontWeight.w400,
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                           Expanded(
        //                             child: Padding(
        //                               padding: const EdgeInsets.all(8.0),
        //                               child: Container(
        //                                 height: 150,
        //                                 width: 150,
        //                                 decoration: BoxDecoration(
        //                                   image: DecorationImage(
        //                                     image: NetworkImage(
        //                                         mybody.objectValue.qrCodeUrl),
        //                                   ),
        //                                   color: Colors.transparent,
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                           Row(
        //                               mainAxisAlignment: MainAxisAlignment.end,
        //                               children: [
        //                                 Padding(
        //                                   padding:
        //                                       const EdgeInsets.only(right: 8.0),
        //                                   child: Container(
        //                                       height: MediaQuery.of(context)
        //                                               .size
        //                                               .height *
        //                                           0.09,
        //                                       width: MediaQuery.of(context)
        //                                               .size
        //                                               .width *
        //                                           0.20,
        //                                       decoration: BoxDecoration(
        //                                           image: DecorationImage(
        //                                         image: NetworkImage(mybody
        //                                             .objectValue.signature),
        //                                       ))),
        //                                 ),
        //                               ]),
        //                           Row(
        //                             mainAxisAlignment: MainAxisAlignment.end,
        //                             children: [
        //                               Padding(
        //                                 padding: EdgeInsets.only(right: 12.0),
        //                                 child:
        //                                     Text(mybody.objectValue.signature,
        //                                         style: GoogleFonts.lato(
        //                                           fontSize: 12,
        //                                         )),
        //                               ),
        //                             ],
        //                           ),
        //                         ]),
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.all(8.0),
        //                       child: Text(
        //                         "Only Valid For 1 Exam",
        //                         style: GoogleFonts.lato(
        //                           fontSize: 20,
        //                           fontWeight: FontWeight.w600,
        //                         ),
        //                       ),
        //                     )
        //                   ]),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ));
        return mybody;
      case 400:
        Get.snackbar("Error!", "Check candidate number",
            colorText: Colors.white, backgroundColor: Colors.pinkAccent);
        break;
      case 401:
        Get.snackbar("Error", "Unauthorised",
            colorText: Colors.white, backgroundColor: Colors.pinkAccent);
        break;
      case 500:
        Get.snackbar("Opps!", "Server Error");
    }

    Get.snackbar("Error", "Candidate not found",
        colorText: Colors.white, backgroundColor: Colors.pinkAccent);
    print(response.statusCode);
    throw Exception('Failed to to get user details');
  }

  //Method that validate exam number
  Future<NewValidator> validateNumber() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ProgressBar(message: "Validating candidate...");
        });
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('pass');
    var endpoint = Uri.parse('$BASE_URL/Candidates/ControlNo/$examNo');
    print(examNo);
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(endpoint, headers: headers);
    Navigator.pop(context);
    switch (response.statusCode) {
      case 200:
        var mybody = NewValidator.fromJson(jsonDecode(response.body));
        print(response.statusCode);
        print("I am here");

        Get.defaultDialog(
            title: "",
            content: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
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
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 5, left: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage:
                                        AssetImage('images/logo.png'),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 12.0, bottom: 12.0),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      NetworkImage(mybody.objectValue.picture),
                                )
                              ],
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border:
                                        Border.all(color: Colors.transparent),
                                    color: Colors.white),
                                height: MediaQuery.of(context).size.height / 2,
                                width: 370,
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8.0),
                                    child: Text(
                                      mybody.objectValue.firstName +
                                          " " +
                                          mybody.objectValue.lastName,
                                      style: GoogleFonts.lato(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 5.0),
                                        child: Text(
                                          "Exam No:",
                                          style: GoogleFonts.lato(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        mybody.objectValue.examNo,
                                        style: GoogleFonts.lato(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                mybody.objectValue.qrCodeUrl),
                                          ),
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.09,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                image: NetworkImage(mybody
                                                    .objectValue.signature),
                                              ))),
                                        ),
                                      ]),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 12.0),
                                        child: Text("signature",
                                            style: GoogleFonts.lato(
                                              fontSize: 12,
                                            )),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Only Valid For 1 Exam",
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ));
        return mybody;

      case 400:
        Get.snackbar("Error!", "Check candidate number",
            colorText: Colors.white, backgroundColor: Colors.pinkAccent);
        break;
      case 401:
        Get.snackbar("Error", "Unauthorised",
            colorText: Colors.white, backgroundColor: Colors.pinkAccent);
        break;
      case 500:
        Get.snackbar("Opps!", "Server Error");
    }

    if (response.statusCode == 500) {
      Get.snackbar("Error", "Candidate not found",
          colorText: Colors.white, backgroundColor: Colors.pinkAccent);
      print(response.statusCode);
    }
    throw Exception('Failed to to get user details');
  }
}
