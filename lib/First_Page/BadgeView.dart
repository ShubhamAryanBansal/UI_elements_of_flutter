import 'package:flutter/material.dart';

final List<String> items = [
  'Appliances',
  'Vehicle',
  'Furniture',
  'Other\nAppliances',
  'Utility'
];
var color;

class BadgeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: <Widget>[
            Container(
              height: 120,
              width: width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 15, 0, 0),
                child: ListView.builder(
                  // padding: EdgeInsets.symmetric(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      color = Colors.redAccent;
                    } else {
                      color = Colors.black;
                    }
                    return Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(70),
                              ),
                              border: Border.all(
                                width: 1,
                                color: color,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                      color, BlendMode.lighten),
                                  child: Image.asset('assets/${index}.png',
                                      width: 25),),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 41,
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: color,
                            foregroundColor: Colors.white,
                            child: Center(
                              child: Text(
                                '21',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Quicksand-Regular'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 64, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 75,
                                height: 34,
                                child: Text('${items[index]}', style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Quicksand-Regular'),
                                  overflow: TextOverflow.clip, softWrap: false,textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
