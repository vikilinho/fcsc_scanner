import 'package:fcsc_admin/controller/login_controller.dart';
import 'package:fcsc_admin/models/login.dart';
import 'package:fcsc_admin/views/RevampPage/admin_page.dart';
import 'package:fcsc_admin/views/new_validationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  TextEditingController _email_address = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
        init: LoginController(),
        builder: (model) => ModalProgressHUD(
              inAsyncCall: model.isLoading.value,
              progressIndicator: SpinKitRipple(
                color: Colors.green,
                size: 100,
              ),
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                  body: SingleChildScrollView(
                    child: Center(
                        child: Column(
                      children: [
                        Image.asset("images/Testmi.png"),
                        SizedBox(height: 60.74.h),
                        Text("Welcome Back!",
                            style: TextStyle(
                                fontFamily: "MuseoSans_500.otf",
                                fontSize: 28.sp,
                                color: Color(0xff024126),
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: 12.h),

                        Text("Enter your login details below to continue",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400)),
                        SizedBox(height: 46.h),

                        Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email"),
                                SizedBox(height: 2.h),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: MediaQuery.of(context).size.width *
                                        0.12,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: TextFormField(
                                          autocorrect: false,
                                          enableSuggestions: false,
                                          validator: (String? email) => email!
                                                  .isEmpty
                                              ? 'Please enter your email address'
                                              : null,
                                          controller: _email_address,
                                          decoration: InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            hintText:
                                                "Eg: abdulolayinka@gmail.com",
                                            alignLabelWithHint: true,
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
                                        color: Color.fromARGB(
                                            003, 017, 011, 007))),
                                SizedBox(height: 16.h),
                                Text("Password"),
                                SizedBox(height: 2.h),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: MediaQuery.of(context).size.width *
                                        0.12,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TextFormField(
                                          enableSuggestions: false,
                                          obscureText:
                                              !model.isPasswordVisible.value,
                                          validator: (String? password) =>
                                              password!.length < 8
                                                  ? 'Please enter a valid password'
                                                  : null,
                                          controller: _password,
                                          decoration: InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                model.isPasswordVisible.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: Color(0xff219653),
                                              ),
                                              onPressed: () => model
                                                  .togglePasswordVisibility(),
                                            ),
                                            hintText: "Password",
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
                                        color: Color.fromARGB(
                                            003, 017, 011, 007))),
                              ],
                            )),
                        SizedBox(
                          height: 64.h,
                        ),
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
                                  Login customerDetails = Login(
                                      _email_address.text, _password.text);

                                  model.login(customerDetails);
                                }
                                // Get.to(() => AdminPage());
                              },
                              child: Text('Sign In',
                                  style: TextStyle(color: Colors.white))),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(15.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Text("Forgot password"),
                        //     ],
                        //   ),
                        // )
                      ],
                    )),
                  )),
            ));
  }
}
