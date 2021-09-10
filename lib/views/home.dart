
import 'package:fcsc_admin/views/validation_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Image(
                image: AssetImage('images/logo.png'),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                        decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                        decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.security_outlined,
                              color: Colors.white,
                            )),
                      ),
                      suffixIcon: Icon(Icons.visibility),
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
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,

                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ValidationScreen()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sign In', style: TextStyle(color: Colors.white)),
                        Icon(Icons.arrow_forward, color: Colors.white)
                      ],
                    )),
              ),
            ],
          )),
        ));
  }
}
