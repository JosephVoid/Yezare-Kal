import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';

class QOptionButton extends StatefulWidget {
  final String title;
  final value;
  final Buttons btnType;
  final Function onPress;
  final bool isSelected;

  QOptionButton({this.title,this.value,this.btnType,this.onPress,this.isSelected = false});

  @override
  _QOptionButtonState createState() => _QOptionButtonState();
}

class _QOptionButtonState extends State<QOptionButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kRed,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: widget.isSelected ? Border.all(color: kBlueBlack,width: 3) : null,
      ),
      child: FlatButton(
        onPressed: widget.onPress,
        child: Text(widget.title,
          style: TextStyle(
              color: kWhite,
              fontSize: widget.btnType == Buttons.DIFFICULTY ? 20 : 30,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

