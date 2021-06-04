import 'package:flutter/material.dart';
import 'package:boxigo_ui_app/LoginFirebase/OTPScreen.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controller = TextEditingController();

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.purple,
        elevation: 14,
        content: Text(
          message!,
          style: TextStyle(
              fontSize: 17,
              fontFamily: 'Quicksand-Regular',
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    print('width = $width');
    var height = MediaQuery.of(context).size.height;
    print('height = $height');
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Phone authentication',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'Quicksand-Regular',
              )),
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    width: width - 60,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: height * .42,
                      width: width - 45,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(2.0, 5.0),
                          ),
                        ],
                      ),
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 30),
                                  child: Text('Login Using Mobile Number',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.purple,
                                        fontSize: 22,
                                        fontFamily: 'Quicksand-Regular',
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Container(
                                  width: 320,
                                  height: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: RichText(
                                        text: TextSpan(
                                            text: "We will send you an",
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: " OTP ",
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'Quicksand-Regular',
                                                  )),
                                              TextSpan(
                                                  text:
                                                      'on this mobile number '),
                                            ],
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Quicksand-Regular',
                                            )),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 37),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 11),
                                  child: Container(
                                    width: 320,
                                    height: 70,
                                    child: TextField(
                                      style: TextStyle(fontSize: 19),
                                      cursorColor: Colors.redAccent,
                                      maxLength: 10,
                                      keyboardType: TextInputType.number,
                                      controller: _controller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        disabledBorder:
                                            const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black12, width: 7),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.red),
                                        ),
                                        focusColor: Colors.redAccent,
                                        hintText: 'Phone Number',
                                        prefix: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            '+91',
                                            style: TextStyle(
                                                color: Colors.redAccent),
                                          ),
                                        ),
                                        hintTextDirection: TextDirection.ltr,
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Quicksand-Regular',
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height * .38, left: 81),
                      child: SizedBox(
                        width: width * .5,
                        height: 60,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          color: Colors.redAccent,
                          elevation: 10,
                          splashColor: Colors.purple,
                          onPressed: () async {
                            final signcode =
                                await SmsAutoFill().getAppSignature;
                            print(signcode);
                            if (_controller.text != null &&
                                _controller.text.characters.length == 10) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OTPScreen(_controller.text),
                                ),
                              );
                            } else {
                              snackBar('Enter Correct Number');
                            }
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Quicksand-Regular',
                                ),
                              ),
                              SizedBox(width: 80),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.black26,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
