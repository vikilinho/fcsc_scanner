import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminPage extends StatefulWidget {
  AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
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
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Icon(
                        Icons.person,
                        color: Color(0xff79807C),
                        size: 50,
                      ),
                    )
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
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
