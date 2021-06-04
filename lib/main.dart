import 'package:boxigo_ui_app/First_Page/AppbarMain.dart';
import 'package:boxigo_ui_app/First_Page/BadgeView.dart';
import 'package:boxigo_ui_app/First_Page/GridCardView.dart';
import 'package:boxigo_ui_app/First_Page/TimeLine.dart';
import 'package:boxigo_ui_app/LoginFirebase/OTPScreen.dart';
import 'package:boxigo_ui_app/Second_Page/UI_2Class.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'First_Page/BoxigoUI.dart';
import 'LoginFirebase/Login.dart';
import 'LoginFirebase/LoginPage.dart';
import 'TestPin_Code_Fields.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}


