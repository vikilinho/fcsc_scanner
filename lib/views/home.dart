import 'package:fcsc_admin/controller/login_controller.dart';
import 'package:fcsc_admin/models/login.dart';
import 'package:flutter/material.dart';
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
                        CircleAvatar(
                          radius: 85,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('images/1024.png'),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),

                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 70,
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
                                            prefixIcon: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                  backgroundColor: Colors.green,
                                                  child: Icon(
                                                    Icons.person,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            hintText: "Email Address",
                                            hintStyle: GoogleFonts.lato(
                                              fontSize: 14,
                                            ),
                                          )),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 70,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
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
                                            prefixIcon: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.security_outlined,
                                                color: Colors.green,
                                              ),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                model.isPasswordVisible.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: Colors.green,
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
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                    )),
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 70,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ))),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  Login customerDetails = Login(
                                      _email_address.text, _password.text);

                                  model.login(customerDetails);
                                }
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Sign In',
                                      style: TextStyle(color: Colors.white)),
                                  Icon(Icons.arrow_forward, color: Colors.white)
                                ],
                              )),
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
