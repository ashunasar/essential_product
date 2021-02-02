import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'procuct.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xffFAF8F3)));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color(0xffFAF8F3),
        // accentColorBrightness: Brightness.dark,
      ),
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
        body: Padding(
          // color: Colors.red,
          padding: EdgeInsets.only(left: 20),
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
              SizedBox(height: 50),
              // ProductCard(),
              Container(
                height: 355,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      // color: Color(0xfff0e2d5),
                      // color: Colors.red,
                      // offset: Offset(0, 70),
                      // blurRadius: 60.0,
                      // spreadRadius: 20,
                      blurRadius: 60.0,
                      offset: Offset(-40, 150),
                      color: Color(0xfff0e2d5),
                      spreadRadius: -70,
                    ),
                  ],
                ), // width: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Product(
                              imagePath: 'assets/product1.png',
                              name: 'Shea Body',
                              price: '30'),
                        ),
                      ),
                      child: ProductCard(
                        imagePath: "assets/product1.png",
                        scale: 1 / 1.16,
                        title: "Shea Body",
                        subTitle: "Butter",
                        price: "30",
                      ),
                    ),
                    SizedBox(width: 40),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Product(
                                  imagePath: 'assets/product2_old.png',
                                  name: 'Body Mist',
                                  price: '19'))),
                      child: ProductCard(
                        imagePath: "assets/product2.png",
                        scale: 1 / 0.19,
                        title: "Body Mist",
                        subTitle: "Care",
                        price: "19",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommend",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "see all",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color(0xffD6AC7B),
                          // letterSpacing: 3,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              // ProductCard(),
              Container(
                height: 105,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 60.0,
                        offset: Offset(-30, 40),
                        color: Color(0xfff0e2d5),
                        spreadRadius: -20),
                  ],
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    RecommendCard(
                      imagePath: "assets/product3.png",
                      title: "Hair Shampoo",
                      price: "28",
                    ),
                    SizedBox(width: 20),
                    RecommendCard(
                      imagePath: "assets/product4.png",
                      title: "Hair Conditioner",
                      price: "35",
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

class RecommendCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  RecommendCard({this.imagePath, this.title, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xfff5eee4),
            Color(0xfff5eee4),
            Color(0xffFAF8F3),
            Color(0xffFAF8F3),
            Color(0xffFAF8F3),
            Color(0xffFAF8F3),
          ],
        ),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Image.asset(imagePath),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 30),
              Text(
                title,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.attach_money,
                              color: Color(0xffAF8455), size: 20),
                        ),
                        TextSpan(
                          text: price,
                          style:
                              TextStyle(color: Color(0xffAF8455), fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 25),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xff371d06),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final String price;
  final double scale;
  const ProductCard(
      {this.imagePath, this.title, this.subTitle, this.price, this.scale});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 270,
      decoration: BoxDecoration(
        color: Colors.white,
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
        borderRadius: BorderRadius.circular(60),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0xfff0e2d5),
        //     offset: Offset(0, 70),
        //     blurRadius: 60.0,
        //     spreadRadius: 20,
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            // width: 200,
            // height: 300,
            // scale: 1 / 1.16,
            scale: scale,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        // color: Colors.black,
                        // letterSpacing: 3,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    subTitle,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        // color: Colors.black,
                        // letterSpacing: 3,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.attach_money_outlined),
                        Text(
                          price,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.grey[400],
                              // letterSpacing: 3,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xff371d06),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        )),
                  ],
                ),
                // Icon(Icons.shopping_bag_outlined),
                // Icon(Icons.attach_money),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
