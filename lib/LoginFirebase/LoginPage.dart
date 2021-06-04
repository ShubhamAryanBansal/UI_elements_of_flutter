import 'dart:async';

import 'package:boxigo_ui_app/LoginFirebase/OTPScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.purple,
        elevation: 14,
        content: Text(message!,style: TextStyle(fontSize: 17,fontFamily: 'Quicksand-Regular',color: Colors.white),),
        duration: Duration(seconds: 2),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    print(width);
    var height = MediaQuery.of(context).size.height;
    print(height);
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Phone authentication',style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Quicksand-Regular',)),
          backgroundColor: Colors.redAccent,
        ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 300,
                  child: Image.asset('assets/logo.png',width: 10),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:50),
              child: Text('Phone authentication',style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.w900,
                fontFamily: 'Quicksand-Regular',),)
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  height: 70,
                  width: 320,
                  child: TextField(
                    style: TextStyle(fontSize: 19),
                    cursorColor: Colors.redAccent,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      disabledBorder:const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12, width: 7),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,color: Colors.red),
                      ),
                      focusColor: Colors.redAccent,
                      hintText: 'Phone Number',
                      prefix: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('+91', style: TextStyle(color: Colors.redAccent),),
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
            ),
          SizedBox(height: height/12),
          Container(
            width: 320,
            height: 50,
            child: RaisedButton(
              color: Colors.redAccent,
              splashColor: Colors.purple,
              elevation: 30,
                child: Text('Next',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: 'Quicksand-Regular',color: Colors.white),),
                onPressed: () async {
                final signcode = await SmsAutoFill().getAppSignature;
                print(signcode);
                if(_controller.text!=null && _controller.text.characters.length == 10) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OTPScreen(_controller.text),),);
                }else{
                  snackBar('Enter correct number');
                }
              }
                ),
          ),
          ],
        ),
      ),
      ),
    );
  }
}
