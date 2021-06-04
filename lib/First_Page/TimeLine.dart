import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

Color completeColor = Colors.redAccent;
Color inProgressColor = Colors.black12;
Color todoColor = Colors.black12;

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  int _processIndex = 2;
  final _processes = [
    'Plan your \n move',
    'Add your \n Inventory',
    'Enter your \n floor Info',
    'Your move \n Summary',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: ConnectorThemeData(
            space: 25.0,
            thickness: 5.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          itemCount: _processes.length,
          connectionDirection: ConnectionDirection.before,
          itemExtentBuilder: (_, __) =>
              MediaQuery.of(context).size.width / _processes.length,
          oppositeContentsBuilder: (context, index) {
            if (index == 1) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: Image.asset(
                  'assets/truck.jpg',
                  width: 40.0,
                ),
              );
            }
          },
          contentsBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                _processes[index],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 12.0,
                  fontFamily: 'Quicksand-Regular',
                ),
              ),
            );
          },
          indicatorBuilder: (_, index) {
            var color;
            var child;
            if (index >= _processIndex) {
              color = inProgressColor;
              return Stack(
                children: [
                  DotIndicator(
                    size: 16.0,
                    color: color,
                  ),
                ],
              );
            } else if (index < _processIndex) {
              color = completeColor;
              return Stack(
                children: [
                  DotIndicator(
                    size: 16.0,
                    color: color,
                    child: child,
                  ),
                ],
              );
            }
          },
            connectorBuilder: (_, index, type) {
              if (index > 0) {
                if (index >= _processIndex) {
                  return DecoratedLineConnector(
                    decoration: BoxDecoration(
                      color: inProgressColor,
                    ),
                  );
                } else {
                  return DecoratedLineConnector(
                    decoration: BoxDecoration(
                      color: completeColor,
                    ),
                  );
                }
              } else {
                return null;
              }
            }
        ),
      ),
    );
  }
}
