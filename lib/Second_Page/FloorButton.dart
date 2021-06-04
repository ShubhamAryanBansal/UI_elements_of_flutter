import 'package:boxigo_ui_app/Second_Page/UI_2Class.dart';
import 'package:flutter/material.dart';

import 'ToggleCls.dart';
class FloorButton extends StatefulWidget {

  @override
  _FloorButtonState createState() => _FloorButtonState();
}

class _FloorButtonState extends State<FloorButton> {
  int count = 0;
  List<bool> _selections = [false, false];
  UI_2ClassState object = new UI_2ClassState();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 40,
                width: 70,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                        ),
                        border: Border.all(
                          width: 1.5,
                          color: Colors.black87,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 35,
                      child: IconButton(
                        iconSize: 18,
                        color: Colors.redAccent,
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(
                                () {
                              if (this.count > 0) {
                                this.count--;
                              } else {
                                this.count;
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Positioned(
                        bottom: 20,
                        left: 26,
                        child: Text(
                          '${this.count}',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Quicksand-Regular'),
                        )),
                    Positioned(
                      left: 44,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          ),
                          border: Border.all(
                            width: 1.4,
                            color: Colors.black87,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 29,
                      child: IconButton(
                        iconSize: 17,
                        color: Colors.redAccent,
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            this.count++;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 100),
              ToggleCls('Yes','No',_selections),
          ],
        ),
      ],
    );
  }
}
