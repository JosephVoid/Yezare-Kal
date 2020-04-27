import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';

Widget appBar({String title, GlobalKey<ScaffoldState> stateKey,IconData icon, Widget countDownTimer}){
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(top: 20,left: 10),
      child: Text(title,
        style: TextStyle(
            color: kBlueBlack,
            fontSize: 40.0,
            fontWeight: FontWeight.w400
        ),
      ),
    ),
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(top: 20,left: 10),
      child: FlatButton(
        onPressed: () => stateKey.currentState.openDrawer(),
        child: Icon(
            icon,
            color: kBlueBlack,
            size: 40.0
        ),
      ),
    ),
    backgroundColor: Colors.white.withOpacity(0),
    actions: <Widget>[
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: countDownTimer
        ),
      )
    ],
  );
}

