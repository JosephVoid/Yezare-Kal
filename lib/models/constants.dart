import 'package:flutter/material.dart';

const Color kBlueBlack = Color(0XFF312D45);
const Color kWhite = Color(0XFFF3F5F8);
const Color kRed = Color(0XFFE84855);

enum Pages{HOME,QUIZ,DICTIONARY,WOD,SETTINGS,ABOUT}
enum Buttons{TIME,DIFFICULTY,NUMBER}

const kInputdecoration = InputDecoration(
  prefixIcon: Icon(Icons.search,color: kBlueBlack,size: 30,),
  contentPadding:
  EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kBlueBlack, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kBlueBlack, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
  ),
);
