import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:fcsc_admin/controller/login_controller.dart';
import 'package:fcsc_admin/models/login.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  TextEditingController _email_address = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var selectedLocation;
  var locations = [
    "Abia",
    "Abuja Federal Capital",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Edo",
    "Ekiti",
    "Enugu",
    "Gombe",
    "Imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Katsina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Lagos",
    "Nassarawa",
    "Niger",
    "Ogun",
    "Ondo",
    "Osun",
    "Oyo",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Yobe",
    "Zamfara"
  ];

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
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Email"),
                                  SizedBox(height: 2.h),
                                  TextFormField(
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      validator: (String? email) => email!
                                              .isEmpty
                                          ? 'Please enter your email address'
                                          : null,
                                      controller: _email_address,
                                      decoration: InputDecoration(
                                        filled: true,
                                        border: InputBorder.none,
                                        focusColor: Colors.grey,
                                        fillColor: Color(0xff12072B1C),
                                        hintText: "Eg: abdulolayinka@gmail.com",
                                        alignLabelWithHint: true,
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 14,
                                        ),
                                      )),
                                  SizedBox(height: 16.h),
                                  Text("Password"),
                                  SizedBox(height: 2.h),
                                  TextFormField(
                                      enableSuggestions: false,
                                      obscureText:
                                          !model.isPasswordVisible.value,
                                      validator: (String? password) =>
                                          password!.length < 8
                                              ? 'Please enter a valid password'
                                              : null,
                                      controller: _password,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Color(0xff12072B1C),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            model.isPasswordVisible.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Color(0xff219653),
                                          ),
                                          onPressed: () =>
                                              model.togglePasswordVisibility(),
                                        ),
                                        alignLabelWithHint: true,
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 14,
                                        ),
                                      )),
                                  SizedBox(height: 2.h),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                          ),
                          child: DropdownSearch<String>(
                            popupProps: PopupProps.menu(
                              showSelectedItems: true,
                              showSearchBox: true,
                              disabledItemFn: (String s) => s.startsWith('I'),
                            ),
                            items: locations,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Location",
                                hintText: "State",
                                filled: true,
                                fillColor: Color(0xff12072B1C),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                selectedLocation = value;

                                log(selectedLocation);
                              });
                            },

                            // selectedItem: "Brazil",
                          ),
                        ),
                        selectedLocation == null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Text(
                                      "Please select a location",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 9.sp),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(),
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
                                if (_formKey.currentState!.validate() ||
                                    selectedLocation == null) {
                                  Login customerDetails = Login(
                                      _email_address.text, _password.text);
                                  final prefs =
                                      await SharedPreferences.getInstance();

                                  prefs.setString(
                                      "selectedLocation", selectedLocation);

                                  model.login(customerDetails);
                                }
                              },
                              child: Text('Sign In',
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ],
                    )),
                  )),
            ));
  }
}
