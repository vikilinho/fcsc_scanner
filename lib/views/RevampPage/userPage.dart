import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String controlNo;
  final String examNumber;
  final String qrCode;

  const UserPage(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.photoUrl,
      required this.controlNo,
      required this.examNumber,
      required this.qrCode})
      : super(key: key);

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

                      // ClipOval(
                      //   child: Image.network(
                      //     "https://t4.ftcdn.net/jpg/03/03/62/45/360_F_303624505_u0bFT1Rnoj8CMUSs8wMCwoKlnWlh5Jiq.jpg",
                      //     height: 100.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
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
                        Text("Barcode")
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
                      // if (_formKey.currentState!.validate()) {
                      //   Login customerDetails = Login(
                      //       _email_address.text, _password.text);

                      //   model.login(customerDetails);
                      // }
                      // Get.to(() => UserPage());
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
