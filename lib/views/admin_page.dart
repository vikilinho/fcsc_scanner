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
          child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(color: Colors.red),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Admin",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text("Welcome Back",
                      style:
                          TextStyle(fontSize: 20.sp, color: Color(0xff024126)))
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
