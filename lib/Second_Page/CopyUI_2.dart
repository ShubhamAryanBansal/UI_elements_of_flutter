import 'package:flutter/material.dart';

import 'FloorButton.dart';
import 'TextAreaClass.dart';
import 'ToggleCls.dart';
import 'Tooltip.dart';
import 'UI_2Class.dart';

class CopyUI_2 extends StatefulWidget {

  String name;
  CopyUI_2(this.name);
  UI_2ClassState object = new UI_2ClassState();

  @override
  _CopyUI_2State createState() => _CopyUI_2State();
}

class _CopyUI_2State extends State<CopyUI_2> {
  int count = 0;
  List<bool> _selections2 = [false, false];
  List<bool> _selections3 = [false, false];
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              height: 59,
              width: 20,
            ),
            Text(
              '${widget.name}',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                fontFamily: 'Quicksand-Regular',
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(
              height: 25,
              width: 20,
            ),
            Text(
              'House Address',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                fontFamily: 'Quicksand-Regular',
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 7, 0, 0),
              child: Container(
                height: 55,
                width: 360,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  cursorColor: Colors.redAccent,
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
                    hintText: 'House No. 210, 1BC Cross Road',
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
        TextAreaClass(),
        Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 15,
                child: Row(
                  children: [
                    Text(
                      'Floor No.',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Quicksand-Regular',
                          color: Colors.black87),
                    ),
                    SizedBox(width: 90),
                    Text(
                      'Elevator Available ? ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Quicksand-Regular',
                          color: Colors.black87),
                    ),
                    TooltipClass(),
                  ],
                ),
              ),
            )
          ],
        ),
        FloorButton(),
        Row(
          children: <Widget>[
            SizedBox(width: 20, height: 25),
            Text(
              'Distance from door to truck',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Quicksand-Regular',
                  color: Colors.black87),
            ),
            SizedBox(width: 60),
        ToggleCls('Ft', 'Mts', _selections2),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(height: 60),
            Container(
              width: 390,
              child: SliderTheme(
                data: SliderThemeData(
                  valueIndicatorColor: Colors.redAccent,
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  showValueIndicator: ShowValueIndicator.always,
                ),
                child: Slider(
                  value: _currentSliderValue,
                  activeColor: Colors.redAccent,
                  inactiveColor: Colors.black54,
                  min: 0,
                  max: 100,
                  label:  _currentSliderValue.round().toString(),
                  divisions: 100,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 20, height: 25),
            Text(
              'Packaging Required ?',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Quicksand-Regular',
                  color: Colors.black87),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 20, height: 40),
            ToggleCls('Yes', 'No', _selections3),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 20, height: 40),
            Text(
              'Any Additional Information',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Quicksand-Regular',
                  color: Colors.black87),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 20, height: 25),
            Container(
              width: 350,
              height: 20,
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                cursorColor: Colors.redAccent,
                style: TextStyle( fontWeight: FontWeight.w900,
                    fontFamily: 'Quicksand-Regular',
                    color: Colors.black),
                decoration: InputDecoration(
                  disabledBorder:const UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black12, width: 7),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1,color: Colors.red),
                  ),
                  focusColor: Colors.redAccent,
                  hintText: 'Ex Dog is available so please call when you reach',
                  hintTextDirection: TextDirection.ltr,
                  hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Quicksand-Regular',
                      color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ],
    );
  }
}
