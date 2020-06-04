import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import  '../screens/quiz_page.dart' as PageQuiz;

class QuestionButton extends StatefulWidget {
  String text;
  String aId;
  Function onPress;
  QuestionButton({this.aId,this.text,this.onPress});

  @override
  _QuestionButtonState createState() => _QuestionButtonState();
}

class _QuestionButtonState extends State<QuestionButton> {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: (){
        PageQuiz.QuestionsPageState().correct();//TODO
      },
      borderSide: BorderSide(color: kRed,width: 2.0),
      child: Text(widget.text),
      splashColor: kRed,
    );
  }
}
