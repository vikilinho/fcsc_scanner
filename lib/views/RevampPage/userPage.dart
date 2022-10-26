import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Image.asset(
                        "images/user_image.png",
                        height: 100.h,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Oladimeji David",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff024126)),
                    ),
                    Text(
                      "oladimejidavid@gmail.com",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff79807C)),
                    )
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
                            "NERC-05-2021-K46GD-HB612JE9HB",
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
              children: [
                Container(
                  height: 140.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: Color.fromARGB(255, 238, 235, 235),
                      ),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/qr_image.png"),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("Barcode")
                    ],
                  ),
                ),
                SizedBox(
                  width: 40.w,
                ),
                Container(
                  height: 140.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: Color.fromARGB(255, 238, 235, 235),
                      ),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/sig.png"),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("Signature")
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                  onPressed: () async {
                    // if (_formKey.currentState!.validate()) {
                    //   Login customerDetails = Login(
                    //       _email_address.text, _password.text);

                    //   model.login(customerDetails);
                    // }
                    Get.to(() => UserPage());
                  },
                  child: Text('Admit Candidate',
                      style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      )),
    );
  }
}
