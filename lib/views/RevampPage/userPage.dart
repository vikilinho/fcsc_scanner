import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              height: 100.h,
              width: 358.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
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
            )
          ],
        ),
      )),
    );
  }
}
