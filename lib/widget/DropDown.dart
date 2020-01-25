import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DropDown extends StatefulWidget {

  final List<String> majors;
  DropDown(List<String> majors):this.majors=majors;
//  const DropDown({Key key,this.majors}): super(key:key);

  @override
  DropDownWidget createState() => DropDownWidget(majors);
}

class DropDownWidget extends State<DropDown> {

  //get the list of the string from api
  List<String> majors;
  String dropDownValue;

  //get the list of the string from api

  DropDownWidget(this.majors){
    this.majors=majors;
    dropDownValue=majors[0];
  }


  @override
  Widget build(BuildContext context) {


    //String dropDownValue=widget.majors[0];
//    List<String> list=widget.majors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
          child: Text("Major Testing"),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            DropdownButton<String>(
              value: dropDownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              style: TextStyle(color: Colors.red, fontSize: 18),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String data) {
                setState(() {
                  dropDownValue = data;
                  Fluttertoast.showToast(
                      msg: dropDownValue.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                });
              },
              items: majors.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        )
      ],
    );
  }
}
