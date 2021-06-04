import 'package:flutter/material.dart';

class GridCardView extends StatefulWidget {

  @override
  _GridCardViewState createState() => _GridCardViewState();
}

class _GridCardViewState extends State<GridCardView> {

  List<String> size = ['S','M','L'];
  var backgroundcolor = Colors.white;
  var textborder  = Colors.black87;
  var backgroundcolor2 = Colors.white;
  var textbordercolor2 = Colors.black87;
  var backgroundcolor3 = Colors.white;
  var textbordercolor3 = Colors.black87;

  String type = 'Type';
  var dropdownColor = Colors.black87;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Scrollbar(
        thickness: 7,
        child: Container(
          color: Colors.white,
          height: 350,
          width: width,
          child: GridView.count(
            childAspectRatio: .8,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 7,
              mainAxisSpacing: 20,
              children: List.generate(8, (index) => Card(
                elevation: 12,
                shadowColor: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 45,
                          width: 5,
                        ),
                        Image.asset('assets/sofa.jpg', height: 68,),
                        SizedBox(width: 7),
                        Text('3 Seater Sofa', style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Quicksand-Regular'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(height: 40,),
                     SelectCircle(context),
                      ],
                    ),
                  Row(
                    children: <Widget>[
                     DropDown(context),
                    ],
                  ),
                 Row(
                   children: <Widget>[
                     AddMinusButton(context),
                   SizedBox(width: 47),
                   Text('Add Similar', style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Quicksand-Regular',fontSize: 14,color: Colors.redAccent),
                   )
                   ],
                 ),

                  ],
                ),
              ),
              ),
          ),
        ),
      ),
    );
  }
Widget SelectCircle(BuildContext context){
    return  Row(
      children: [
        SizedBox(width: 40,height: 40,),
        InkWell(
          child: Container(
              decoration: BoxDecoration(
                color: backgroundcolor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: textborder,
                  style: BorderStyle.solid,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text('S',
                  style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Quicksand-Regular', color: textborder),),
              )),
          onTap: (){
            setState((){
              this.backgroundcolor = Colors.redAccent;
              this.textborder = Colors.white;
              this.backgroundcolor2 = Colors.white;
              this.textbordercolor2 = Colors.black87;
              this.backgroundcolor3 = Colors.white;
              this.textbordercolor3 = Colors.black87;
            });
          },
        ),
        SizedBox(width: 10),
        InkWell(
          child: Container(
              decoration: BoxDecoration(
                color: backgroundcolor2,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: textbordercolor2,
                  style: BorderStyle.solid,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.7),
                child: Text('M',
                  style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Quicksand-Regular', color: textbordercolor2),),
              )),
          onTap: (){
            setState((){
              this.backgroundcolor2 = Colors.redAccent;
              this.textbordercolor2 = Colors.white;
              this.backgroundcolor = Colors.white;
              this.textborder = Colors.black87;
              this.backgroundcolor3 = Colors.white;
              this.textbordercolor3 = Colors.black87;
            });
          },
        ),
        SizedBox(width: 10),
        InkWell(
          child: Container(
              decoration: BoxDecoration(
                color: backgroundcolor3,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: textbordercolor3,
                  style: BorderStyle.solid,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text('L',
                  style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Quicksand-Regular', color: textbordercolor3),),
              ),),
          onTap: (){
            setState((){
              this.backgroundcolor3 = Colors.redAccent;
              this.textbordercolor3 = Colors.white;
              this.backgroundcolor = Colors.white;
              this.textborder = Colors.black87;
              this.backgroundcolor2 = Colors.white;
              this.textbordercolor2 = Colors.black87;
            });
          },
        ),
      ],
    );
}
Widget DropDown(BuildContext context){
    return Row(
      children : <Widget>[
      SizedBox(width: 20,height: 70),
      SizedBox(
          width: 55,
          child: Text('${this.type}',style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Quicksand-Regular', color: dropdownColor, fontSize: 14),)),
      DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down_rounded),
        iconSize: 24,
        underline: Container(color: Colors.white),
        iconDisabledColor: Colors.grey,
        elevation: 10,
        iconEnabledColor: Colors.black87,
        onChanged: (String? newValue){
          setState((){
            this.type = newValue!;
            dropdownColor = Colors.redAccent;
          });
        },
        items: <String>['Lawson','Tuxedo','Chesterfield','Recliner'].map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Quicksand-Regular', color: Colors.redAccent, fontSize: 14,),),
          );
        },).toList(),
      ),
   ],
    );
}
Widget AddMinusButton(BuildContext context){
    return Row(
      children: <Widget>[
        SizedBox(width: 2),
        Container(
          width:35,
          child: IconButton(
            iconSize: 20,
            onPressed: (){
              setState(() {
                if(this.count > 0){
                  this.count--;
                }else{
                  this.count;
                }
              });
            },
            icon: Icon(Icons.remove),
            color: Colors.black87,
          ),
        ),
        Container(
            width: 7,
            child: Text('${this.count}',style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Quicksand-Regular',fontSize: 16),)),
        Container(
          width: 12,
          child: IconButton(
            iconSize: 20,
            onPressed: (){
              setState(() {
                this.count++;
              });
            },
            icon: Icon(Icons.add),
            color: Colors.black87,
          ),
        ),
      ],
    );
}
}
