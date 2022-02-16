import 'dart:convert';

import 'package:fcsc_admin/component/constants.dart';
import 'package:fcsc_admin/component/progressbar.dart';
import 'package:fcsc_admin/models/new_validator.dart';
import 'package:fcsc_admin/views/accreditation.dart';
import 'package:fcsc_admin/views/home.dart';
import 'package:fcsc_admin/models/validator.dart';

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
            scanCard();
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
      resizeToAvoidBottomInset: false,
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
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/ixam_edited.png')),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
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

  Future<Accreditation> scanCard() async {
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
    // var endpoint = Uri.parse('$BASE_URL/Candidates/ControlNo/$newValue');
    var newEndpoint = Uri.parse(
        '$BASE_URL/Accreditation/get-accreditation-serialno?serialNo=$newValue');

    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(newEndpoint, headers: headers);
    Navigator.pop(context);
    switch (response.statusCode) {
      case 200:
        var mybody = Accreditation.fromJson(jsonDecode(response.body));
        print(response.statusCode);

        Get.defaultDialog(
            title: "",
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                              style: BorderStyle.solid),
                          color: Colors.white),
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage('images/flogo.png'),
                                ),
                                Text(
                                  "Promotional Exam\nAccreditation Tag 2021",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                          mybody.response.passportUrl),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.height * 0.12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Text(
                                    mybody.response.firstName +
                                        " " +
                                        mybody.response.lastName,
                                    style: GoogleFonts.lato(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
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
                                  mybody.response.examNo,
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.18,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            mybody.response.qrCodeUrl),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            mybody.response.signatureUrl),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Text(
                                      mybody.response.serialNo,
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text("Signature",
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text("Only Valid for 1 Exam",
                                        style: GoogleFonts.lato(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      "© iXam Portal",
                                      style: GoogleFonts.mulish(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
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

    Get.snackbar("Error", "Candidate not found",
        colorText: Colors.white, backgroundColor: Colors.pinkAccent);
    print(response.statusCode);
    throw Exception('Failed to to get user details');
  }

  //Method that validate exam number
  Future<Accreditation> validateNumber() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ProgressBar(message: "Validating candidate...");
        });
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('pass');
    var newEndpoint = Uri.parse(
        '$BASE_URL/Accreditation/get-accreditation-serialno?serialNo=$examNo');

    print(examNo);
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(newEndpoint, headers: headers);
    Navigator.pop(context);
    switch (response.statusCode) {
      case 200:
        var mybody = Accreditation.fromJson(jsonDecode(response.body));
        print(response.statusCode);
        print("I am here");

        Get.defaultDialog(
            title: "",
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                              style: BorderStyle.solid),
                          color: Colors.white),
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage('images/flogo.png'),
                                ),
                                Text(
                                  "Promotional Exam\nAccreditation Tag 2021",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                          mybody.response.passportUrl),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.height * 0.12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Text(
                                    mybody.response.firstName +
                                        " " +
                                        mybody.response.lastName,
                                    style: GoogleFonts.lato(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
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
                                  mybody.response.examNo,
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.18,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            mybody.response.qrCodeUrl),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            mybody.response.signatureUrl),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Text(
                                      mybody.response.serialNo,
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text("Signature",
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text("Only Valid for 1 Exam",
                                        style: GoogleFonts.lato(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      "© iXam Portal",
                                      style: GoogleFonts.mulish(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
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
