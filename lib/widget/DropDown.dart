import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State {
  String dropDownValue = "One";
  //get the list of the string from api
  List<String> spinnerItems = ['One', 'Two', 'Three', 'Four', 'Five'];
  @override
  Widget build(BuildContext context) {
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
                });
              },
              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
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
