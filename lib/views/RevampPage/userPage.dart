import 'dart:convert';
import 'dart:developer';

import 'package:fcsc_admin/component/constants.dart';
import 'package:fcsc_admin/views/RevampPage/admin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String controlNo;
  final String examNumber;
  final String qrCode;
  final int candidateId;
  final int serveQuizId;

  const UserPage(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.photoUrl,
      required this.controlNo,
      required this.examNumber,
      required this.qrCode,
      required this.candidateId,
      required this.serveQuizId})
      : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Future admitCandidate({
    required Map email,
  }) async {
    try {
      var body = json.encode(email);

      // print("body ==> $body");
      var url = BASE_URL + "/Quiz/Candidate/Attendance ";
      final prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('pass');

      var response = await http.post(Uri.parse(url), body: body, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json, text/plain, */*',
        'Accept-Encoding': "gzip, deflate, br",
        'Authorization': 'Bearer $token'
      });

      var decode = json.decode(response.body);

      var message = decode['message'];

      if (response.statusCode == 200) {
        Get.snackbar("Success", message,
            colorText: Colors.white, backgroundColor: Colors.green);

        Get.to(AdminPage());
      } else {
        Get.snackbar("Error", message,
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      print('exception ====>>> $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.w,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 68,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage: NetworkImage(
                            "https://t4.ftcdn.net/jpg/03/03/62/45/360_F_303624505_u0bFT1Rnoj8CMUSs8wMCwoKlnWlh5Jiq.jpg",
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        widget.firstName + " " + widget.lastName,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff024126)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Container(
                height: 90.h,
                width: 358.w,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 238, 235, 235),
                    ),
                    color: Colors.white),
                child: Row(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 50,
                        child: Image.asset("images/nerc.png"),
                      )
                    ],
                  ),
                  SizedBox(width: 24.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "NERC 2022 Recruitment\nExamination",
                        style: TextStyle(
                            color: Color(0xff79807C),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ]),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 50.h,
                width: 358.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 238, 235, 235),
                    ),
                    color: Colors.white),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            Text(
                              "Exam Number",
                              style: TextStyle(color: Color(0xff79807C)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            Text(
                              widget.examNumber,
                              style: TextStyle(
                                  color: Color(0xff219653),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 140.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          color: Color.fromARGB(255, 238, 235, 235),
                        ),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "https://testminerc.azurewebsites.net/Uploads/70373a07-cf24-4311-bdd4-1151e870a005.png",
                          height: 150,
                        ), //widget.qrCode
                        SizedBox(
                          height: 8.h,
                        ),
                        Text("barcode") //barcode
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: 300.w,
                height: 40.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff219653)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () async {
                      //call admit endpoint
                      DateTime now = new DateTime.now();
                      DateTime date =
                          new DateTime(now.year, now.month, now.day);
                      String scheduleDate = date.toUtc().toIso8601String();
                      var candidateDetails = {
                        "serveQuizId": 0,
                        "location": "string",
                        "scheduleDate": scheduleDate,
                        "candidateId": 0
                      };
                      log("how are you doing this");

                      print(now.toString());
                    },
                    child: Text('Admit Candidate',
                        style: TextStyle(color: Colors.white))),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
