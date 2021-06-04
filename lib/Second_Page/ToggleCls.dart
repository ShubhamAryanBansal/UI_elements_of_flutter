import 'package:flutter/material.dart';

class ToggleCls extends StatefulWidget {

  String first;
  String second;
  List<bool> selections;

  ToggleCls(this.first,this.second,this.selections);

  @override
  _ToggleClsState createState() => _ToggleClsState();
}

class _ToggleClsState extends State<ToggleCls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: ToggleButtons(
        constraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 37,
        ),
        borderColor: Colors.black87,
        selectedBorderColor: Colors.redAccent,
        disabledColor: Colors.black87,
        direction: Axis.horizontal,
        isSelected: widget.selections,
        selectedColor: Colors.white,
        fillColor: Colors.redAccent,
        disabledBorderColor: Colors.white,
        color: Colors.black87,
        borderRadius: BorderRadius.circular(5),
        borderWidth: 1,
        children: <Widget>[
          Text(
            '${widget.first}',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Quicksand-Regular'),
          ),
          Text(
            '${widget.second}',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Quicksand-Regular'),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < widget.selections.length; i++) {
              if (i == index) {
                widget.selections[i] = !widget.selections[i];
              } else {
                widget.selections[i] = false;
              }
            }
          });
        },
      ),
    );
  }
}
