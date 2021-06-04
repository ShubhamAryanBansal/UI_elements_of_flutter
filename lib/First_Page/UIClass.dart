import 'package:boxigo_ui_app/First_Page/TimeLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AppbarMain.dart';
import 'BadgeView.dart';
import 'GridCardView.dart';
import '../Second_Page/UI_2Class.dart';

class UIClass extends StatefulWidget {
  @override
  _UIClassState createState() => _UIClassState();
}

class _UIClassState extends State<UIClass> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 10);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    print(width);
    var height = MediaQuery.of(context).size.height;
    print(height);
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => UI_2Class()),);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(7.0, 12.0, 0.0, 0.0),
                child: Row(
                  children: <Widget>[
                   Expanded(
                     child: Container(
                       width: width,
                         height: 70,
                         child: AppbarMain()),
                   ),
                  ],
                ),
              ),
              //For TimeLine
              Row(
                children: <Widget>[
                  Container(
                    height: height / 7,
                    width: width,
                    child: TimeLine(),
                  ),
                ],
              ),
              //For total Items Row
              Row(
                children: <Widget>[
                  Text('  Total Items', style: TextStyle(fontFamily: 'Quicksand-Regular', fontSize: 16, fontWeight: FontWeight.w700,)),
                  SizedBox(width: 7),
                  Container(
                      height: 25,
                      width: 25,
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Text('70', style: TextStyle(fontFamily: 'Quicksand-Regular', fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),))),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  ButtonTheme(
                    minWidth: 20,
                    height: 25,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => UI_2Class()),);
                      },
                      child: Text('skip', style: TextStyle(fontFamily: 'Quicksand-Regular', fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 19),
                ],
              ),
              //For BadgeView
              Row(
                children: <Widget>[
                  Container(height: 120, width: width, child: BadgeView()),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: width,
                    child: DefaultTabController(
                      length: 5,
                      child: Scaffold(
                        body: TabBar(
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(horizontal: 23),
                          labelColor: Colors.black87,
                          indicatorColor: Colors.redAccent,
                          indicatorWeight: 1.8,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'Quicksand-Regular'),
                          unselectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'Quicksand-Regular'),
                          unselectedLabelColor: Colors.black54,
                          tabs: [
                            Tab(text: ('Sofa')),
                            Tab(text: 'Chair'),
                            Tab(text: 'Cabinet'),
                            Tab(text: 'Table'),
                            Tab(text: 'Bed'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GridCardView(),
            ],
          ),
        ),
      ),
    );
  }
}
