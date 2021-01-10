import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFAF8F3),
        body: Container(
          // color: Colors.red,
          margin: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "HERBAL",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 3,
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Products",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 3,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffAF8455),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(width: 30),
                ],
              ),
              SizedBox(height: 30),
              // Container(
              //   height: 300,
              //   width: 250,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [
              //         Color(0xffFAF8F3),
              //         Color(0xffFAF8F3),
              //         Color(0xffFAF8F3),
              //         Colors.white,
              //         Colors.white,
              //         Colors.white,
              //         Colors.white,
              //         Colors.white,
              //       ],
              //     ),
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Color(0xfff0e2d5),
              //         offset: Offset(0, 70),
              //         blurRadius: 60.0,
              //         spreadRadius: 20,
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 400,
                // width: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 300,
                      width: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFAF8F3),
                            Color(0xffFAF8F3),
                            Color(0xffFAF8F3),
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xfff0e2d5),
                            offset: Offset(0, 70),
                            blurRadius: 60.0,
                            spreadRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 40),
                    Container(
                      height: 300,
                      width: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFAF8F3),
                            Color(0xffFAF8F3),
                            Color(0xffFAF8F3),
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xfff0e2d5),
                            offset: Offset(0, 70),
                            blurRadius: 60.0,
                            spreadRadius: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
