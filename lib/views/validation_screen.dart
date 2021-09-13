import 'dart:convert';

import 'package:fcsc_admin/component/constants.dart';

import 'package:fcsc_admin/models/validation.dart';
import 'package:fcsc_admin/views/home.dart';
import 'package:fcsc_admin/views/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String finalOutput = '';

class ValidationScreen extends StatefulWidget {
  
  @override
  _ValidationScreenState createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  var output = "";

  Future<void> getfinalOutput() async {
    setState(() {
      finalOutput = output;
    });
  }

  Future<void> scanQRCode() async {
    try {
      final output = await FlutterBarcodeScanner.scanBarcode(
        '#ff38AA5F',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(()  {
        this.output = output;
        //once the code has been scanned, the endpoint is called using the output as parameter
        scanCard();
      });
    } on PlatformException {
      output = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              child: Column(
            children: [
              Center(
                child: Text(
                  "Welcome Back!",
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('images/logo.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.002,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
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
                        Text('Scan Card',
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            )),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    output,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
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
                "Validate Exam Number",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                        decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "Exam Number",
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
                width: MediaQuery.of(context).size.width * 0.6,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserCard()),
                      );
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
              ElevatedButton(
                  onPressed: () async {
                    Get.to(HomeScreen());
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.remove('pass');
                  },
                  child: Text("Logout")),
            ],
          )),
        ),
      ),
    );
  }

  //The method for validating the card... once user scan the card
  Future<Validation> scanCard() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('pass');
    var endpoint = Uri.parse('$BASE_URL/Candidates/ControlNo/$output');
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(endpoint, headers: headers);
    if (response.statusCode == 200) {
      return Validation.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      throw Exception('Failed to to get user details');
    }
  }
}
