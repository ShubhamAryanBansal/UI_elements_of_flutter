import 'package:flutter/material.dart';

class TextAreaClass extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  child: Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Quicksand-Regular',
                      color: Colors.black87,
                    ),
                  ),),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Container(
                height: 20,
                child: Text(
                  'Kasturi Nagar',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Quicksand-Regular',
                    color: Colors.grey,
                  ),
                ),),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                    height: 20,
                    child: Text(
                      'City',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Quicksand-Regular',
                          color: Colors.black87),
                    )),
              )
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Text(
                'Bangalore',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Quicksand-Regular',
                    color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                    height: 20,
                    child: Text(
                      'Pincode*',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Quicksand-Regular',
                          color: Colors.black87),
                    )),
              )
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Text(
                '560043',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Quicksand-Regular',
                    color: Colors.grey),
              ),
            ],
          ),
        ],
    );
  }
}
