import 'package:flutter/material.dart';

class AppbarMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: <Widget>[
            Image.asset('assets/logo.png', width: width / 2),
            Spacer(flex: 1),
            Container(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text('Shubham', style: TextStyle(fontSize: 20.0, fontFamily: 'Quicksand-Regular'),)),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 11.0, 20.0, 0.0),
              width: 40.0, // you can adjust the width as you need
              child: IconButton(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 7.0, 0.0),
                onPressed: () {
                  print('Pressed');
                },
                icon: Icon(Icons.arrow_drop_down_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
