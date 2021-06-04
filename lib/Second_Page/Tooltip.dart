import 'package:flutter/material.dart';

class TooltipClass extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Multi-Storey',
      showDuration: const Duration(seconds: 2),
      verticalOffset: 20,
      height: 8,
      textStyle: TextStyle(
          fontFamily: 'Quicksand-Regular',
          color: Colors.white),
      child: Container(
        height: 18,
        width: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.5,
            color: Colors.redAccent,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
          child: Text(
            'i',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                fontFamily: 'Quicksand-Regular',
                color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
