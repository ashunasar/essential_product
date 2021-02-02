import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class Product extends StatefulWidget {
  final String imagePath;
  final String name;
  final String price;
  // final String imagePath
  Product(
      {@required this.imagePath, @required this.name, @required this.price});
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  // var _razorpay = Razorpay();
  // @override
  // void initState() {
  //   // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  //   // SystemChrome.setSystemUIOverlayStyle(
  //   //     SystemUiOverlayStyle(statusBarColor: Color(0xffFAF8F3)));
  //   super.initState();

  //   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  //   _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  // }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   // Do something when payment succeeds
  //   // print(response);
  //   print('payment success');
  // }

  // void _handlePaymentError(PaymentFailureResponse response) {
  //   // Do something when payment fails
  //   // print(response);
  //   print('payment error');
  // }

  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   // Do something when an external wallet was selected
  //   // print(response);
  //   print('payment external');
  // }

  // @override
  // void dispose() {
  //   // SystemChrome.setEnabledSystemUIOverlays(
  //   //     [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  //   // SystemChrome.setSystemUIOverlayStyle(
  //   //     SystemUiOverlayStyle(statusBarColor: Color(0xffFAF8F3)));

  //   super.dispose();
  //   _razorpay.clear();
  // }

  Razorpay razorpay;
  // TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_8dkNoMrd1kypJR",
      "amount": num.parse(widget.price) * 100,
      "name": "Sample App",
      "description": "Payment for ${widget.name}",
      "prefill": {"contact": "1234567890", "email": "example@mail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Pament success");
    Toast.show("Pament success", context);
  }

  void handlerErrorFailure() {
    print("Pament error");
    Toast.show("Pament error", context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Color(0xffE1B07E),
            //     Color(0xffE1B07E),
            //     Color(0xffE1B07E),
            //     Color(0xffE1B07E),
            //     Color(0xffD29F6B),
            //     Color(0xffD29F6B),
            //     Color(0xffBC8653),
            //     Color(0xffBC8653),
            //   ],
            // ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Image.asset(
                  // 'assets/product2_old.png',
                  widget.imagePath,
                  fit: BoxFit.cover, scale: 1 / 1.25,
                  // color: Colors.red,
                ),
              ),
              SizedBox(
                  height: (widget.imagePath == 'assets/product1.png'
                      ? height / 7
                      : 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // "Body Mist",
                    widget.name,
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "120 ml",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Body mist Fragrance Spray is floral, With top notes of black tea, cyclamen, and monstera leaf blended with orhids.',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.attach_money,
                              color: Colors.white, size: 20),
                        ),
                        TextSpan(
                          // text: "19",
                          text: widget.price,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xffa97746),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "1",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xffa97746),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(
                    Icons.favorite_outline_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 60),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // var options = {
                              //   'key': 'rzp_test_8dkNoMrd1kypJR',
                              //   'amount': widget.price,
                              //   'name': 'Acme Corp.',
                              //   'description': 'Fine T-Shirt',
                              //   'prefill': {
                              //     'contact': '8888888888',
                              //     'email': 'test@razorpay.com'
                              //   }
                              // };
                              // _razorpay.open(options);
                              openCheckout();
                            },
                            child: Text(
                              "Add to basket",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Container(
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
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
