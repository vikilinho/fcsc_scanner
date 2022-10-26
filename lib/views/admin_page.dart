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
            SizedBox(height: 42.h),
            Container(
              height: 200.h,
              width: 358.w,
              decoration: BoxDecoration(
                  color: Color(0xffE6F2EC),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Container(
                    width: 355.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("images/container_image.png"))),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 17.w,
                      ),
                      Icon(Icons.qr_code),
                      SizedBox(
                        width: 21.25.w,
                      ),
                      Text("Scan Exam Card"),
                      SizedBox(
                        width: 139.w,
                      ),
                      Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 211, 223, 218),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
