import 'package:boxigo_ui_app/First_Page/UIClass.dart';
import 'package:flutter/material.dart';

class BoxigoUI extends StatefulWidget {

  @override
  _BoxigoUIState createState() => _BoxigoUIState();
}

class _BoxigoUIState extends State<BoxigoUI> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      //  brightness: Brightness.dark,
        primarySwatch: Colors.red,
       primaryColor: Colors.redAccent,
       accentColor: Colors.redAccent,
       brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: UIClass(),
      ),
    );
  }
}
