import 'dart:async';
import 'dart:ffi';

import 'package:boxigo_ui_app/First_Page/BoxigoUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPScreen extends StatefulWidget {
  final String phone;

  OTPScreen(this.phone);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  String _verificationCode = '';

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    verifyPhone();
    _listenOTP();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }
  verifyPhone () async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
        if(value.user != null){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BoxigoUI()), (route) => false);
        }
      });
      },
      verificationFailed: (FirebaseAuthException e){
        print(e.message);
      },
      codeSent: (String verificationID, int? resendToken){
        setState(() {
        _verificationCode = verificationID;
        });
      },
      codeAutoRetrievalTimeout: (String verificationID){
        setState(() {
          _verificationCode = verificationID;
        });
      },
     timeout: Duration(seconds: 60),
    );
  }

  void _listenOTP() async{
    await SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('OTP Verification',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'Quicksand-Regular',
              )),
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: 100,
                  width: 300,
                  child: RichText(
                    text: TextSpan(
                        text: "Enter the OTP sent to ",
                        children: [
                          TextSpan(
                              text: "${widget.phone}",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Quicksand-Regular',
                              ),),
                        ],
                        style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                      textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      obscuringWidget: FlutterLogo(
                        size: 24,
                      ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        activeColor: Colors.redAccent,
                        shape: PinCodeFieldShape.underline,
                        fieldWidth: 40,
                      ),
                      cursorColor: Colors.redAccent,
                      animationDuration: Duration(milliseconds: 300),
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      onCompleted: (pin) async {
                        try{
                          await FirebaseAuth.instance.signInWithCredential(
                              PhoneAuthProvider.credential(verificationId: _verificationCode, smsCode: pin)).then((value) async{
                            if(value.user != null){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BoxigoUI()), (route) => false);
                            }
                          });
                        }catch(e){
                          FocusScope.of(context).unfocus();
                          errorController!.add(ErrorAnimationType.shake); // Triggering error shake animation
                          setState(() {
                            hasError = true;
                          });
                        }
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        return true;
                      },
                    )),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "Incorrect OTP" : "",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,fontFamily: 'Quicksand-Regular'),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
