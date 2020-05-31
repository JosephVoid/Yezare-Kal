import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';

class RadioButtons extends StatefulWidget {
  int groupValue;
  final int value;
  Function onPress;
  final String text;
  RadioButtons({this.value,this.groupValue,this.onPress,this.text});

  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Radio(
            value: 2,
            activeColor: kRed,
            focusColor: kRed,
            groupValue: widget.groupValue,
            onChanged: (value) {
              setState(() {
                widget.groupValue = value;
                widget.onPress();
              });
            },
          ),
          GestureDetector(
              onTap: (){ setState(() {widget.groupValue = widget.value;}); },
              child: Text(widget.text,style: TextStyle(fontSize: 25,color: kBlueBlack),)),
        ],
      ),
    );
  }
}
