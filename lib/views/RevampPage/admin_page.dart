import 'dart:convert';
import 'dart:developer';

import 'package:fcsc_admin/component/constants.dart';
import 'package:fcsc_admin/component/progressbar.dart';
import 'package:fcsc_admin/models/userData.dart';
import 'package:fcsc_admin/views/RevampPage/home.dart';
import 'package:fcsc_admin/views/RevampPage/userPage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final String logOut = 'images/log_out.svg';
final String scan = 'images/scan-bar.svg';
final String arrow = 'images/arrow-right.svg';
final String shape = 'images/Shape.svg';

class AdminPage extends StatefulWidget {
  AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  TextEditingController _examNumber = TextEditingController();
  var examNo;
  final Widget logOutIcon = SvgPicture.asset(
    logOut,
    semanticsLabel: 'call Icon ',
    height: 10.83.h,
    width: 10.87.w,
  );

  final Widget scanBar = SvgPicture.asset(
    scan,
    semanticsLabel: 'call Icon ',
    height: 24.83.h,
    width: 24.87.w,
  );
  final Widget arrowRight = SvgPicture.asset(
    arrow,
    semanticsLabel: 'arrow Icon ',
    height: 20.33.h,
    width: 15.9.w,
  );
  final Widget shapeIcon = SvgPicture.asset(
    shape,
    semanticsLabel: 'arrow Icon ',
    height: 26.66.h,
    width: 21.33.w,
  );
  String? controlNumber = "";
  String newValue = "";

  Future<UserDataModel> scanCard() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ProgressBar(
            message: "Fetching candidate data...",
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
        var mybody = UserDataModel.fromJson(jsonDecode(response.body));
        print(response.statusCode);
        Get.to(UserPage(
          serveQuizId: mybody.objectValue!.serveQuizId as int,
          candidateId: mybody.objectValue!.candidateId as int,
          firstName: mybody.objectValue!.firstName.toString(),
          lastName: mybody.objectValue!.lastName.toString(),
          photoUrl: mybody.objectValue!.candidatePhoto.toString(),
          examNumber: mybody.objectValue!.examNo.toString(),
          qrCode: mybody.objectValue!.qrCode.toString(),
          controlNo: mybody.objectValue!.controlNo.toString(),
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

  Future<UserDataModel> validateNumber() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ProgressBar(
            message: "Fetching candidate data...",
          );
        });
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('pass');
    var endpoint = Uri.parse('$BASE_URL/Candidates/ControlNo/$examNo');
    log("The validation endpoint is: " + endpoint.toString());

    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(endpoint, headers: headers);
    Navigator.pop(context);
    switch (response.statusCode) {
      case 200:
        var mybody = UserDataModel.fromJson(jsonDecode(response.body));
        log("candidate id from server is " +
            mybody.objectValue!.candidateId.toString());

        print(response.statusCode);
        Get.to(() => UserPage(
              serveQuizId: mybody.objectValue!.serveQuizId as int,
              candidateId: mybody.objectValue!.candidateId as int,
              firstName: mybody.objectValue!.firstName.toString(),
              lastName: mybody.objectValue!.lastName.toString(),
              photoUrl: mybody.objectValue!.candidatePhoto.toString(),
              examNumber: mybody.objectValue!.examNo.toString(),
              qrCode: mybody.objectValue!.qrCode.toString(),
              controlNo: mybody.objectValue!.controlNo.toString(),
            ));
        return mybody;
      case 400:
        Get.snackbar(response.statusCode.toString(), "User not found",
            colorText: Colors.white, backgroundColor: Colors.pinkAccent);
        break;
      case 401:
        Get.snackbar("Error", "Unauthorised",
            colorText: Colors.white, backgroundColor: Colors.pinkAccent);
        break;
      case 500:
        Get.snackbar("Opps!", "Server Error");
    }

    // Get.snackbar("Error", "Candidate not found",
    //     colorText: Colors.white, backgroundColor: Colors.pinkAccent);
    // print(response.statusCode);
    throw Exception('Failed to to get user details');
  }

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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Color(0xffF0F3F5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: shapeIcon)
                    ],
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Admin",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text("Welcome Back",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Color(0xff024126),
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     IconButton(
                  //         onPressed: () {},
                  //         icon: Icon(
                  //           Icons.logout_rounded,
                  //           color: Colors.red,
                  //         )),
                  //   ],
                  // )
                ],
              ),
              SizedBox(height: 42.h),
              GestureDetector(
                onTap: () => scanQRCode(),
                child: Container(
                  height: 170.h,
                  width: 358.w,
                  decoration: BoxDecoration(
                      color: Color(0xffE6F2EC),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        width: 355.w,
                        height: 130.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image:
                                    AssetImage("images/container_image.png"))),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 17.w,
                          ),
                          scanBar,
                          SizedBox(
                            width: 8.25.w,
                          ),
                          Text(
                            "Scan Exam Card",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 120.w,
                          ),
                          Container(
                              width: 32.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 211, 223, 218),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: arrowRight))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Container(
                    width: 140.w,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 211, 223, 218),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("or"))),
                  Container(
                    width: 145.w,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                "Enter candidate’s control number to validate",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff79807C)),
              ),
              SizedBox(height: 30.h),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                          width: 300.w,
                          height: 40.h,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                                onChanged: (value) {
                                  examNo = value.toString().trim();
                                },
                                autocorrect: false,
                                enableSuggestions: false,
                                validator: (String? number) => number!.isEmpty
                                    ? 'Please enter candidate Exam Number'
                                    : null,
                                controller: _examNumber,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "1234566677",
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 14,
                                  ),
                                )),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              color: Color.fromARGB(003, 017, 011, 007))),
                      SizedBox(height: 30.h),
                      Container(
                        width: 300.w,
                        height: 40.h,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff219653)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ))),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                validateNumber();
                              }
                            },
                            child: Text('Validate',
                                style: TextStyle(color: Colors.white))),
                      ),
                      SizedBox(height: 80.h),
                      GestureDetector(
                        onTap: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.remove('pass');
                          Get.off(() => HomeScreen());
                        },
                        child: Container(
                          width: 300.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: Color(0xffFFE5E5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                logOutIcon,
                                SizedBox(
                                  width: 12.08.w,
                                ),
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                      color: Color(0xffD90A0A),
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 300.w,
                      //   height: 40.h,
                      //   child: ElevatedButton(
                      //       style: ButtonStyle(
                      //           backgroundColor: MaterialStateProperty.all(
                      //               Color(0xffFFE5E5)),
                      //           shape: MaterialStateProperty.all<
                      //                   RoundedRectangleBorder>(
                      //               RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //           ))),
                      //       onPressed: () async {
                      //         final SharedPreferences prefs =
                      //             await SharedPreferences.getInstance();
                      //         await prefs.remove('pass');
                      //         Get.to(() => HomeScreen());
                      //       },
                      //       child: Text('Log Out',
                      //           style: TextStyle(color: Color(0xffD90A0A)))),
                      // ),
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
