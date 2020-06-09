import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import '../models/word.dart';

class AQuestion extends StatelessWidget {
  final Word question;
  final List<Word> words;
  final int answerPos;
  final Function onPress;

  AQuestion({this.question,this.answerPos,this.words,this.onPress});
  // Generate a Random choice
  void addRandomChoice(List<String> choices,String answer){
    for(;;){
      int random = Random().nextInt(words.length);
      if (random != answerPos && !choices.contains(words[random]) && !choices.contains(answer)){
        choices.add(words[random].definition1);
        return;
      }
      else continue;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> choices = [];

    for(int i = 0 ; i < 3 ; i++) // Adds 3 random/wrong choices
      addRandomChoice(choices,words[answerPos].definition1);

    choices.add(words[answerPos].definition1); // Adds the correct answer to the list of choices
    choices.shuffle(); // Shuffles the choices
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Center(
            child: Text(question.word,style:
            TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
                color: kBlueBlack
            ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              OutlineButton(
                onPressed: () => onPress(choices[0],question.definition1),
                borderSide: BorderSide(color: kRed,width: 2.0),
                child: Text(choices[0]),
                splashColor: kRed,
                ),
              OutlineButton(
                onPressed: () => onPress(choices[1],question.definition1),
                borderSide: BorderSide(color: kRed,width: 2.0),
                child: Text(choices[1]),
                splashColor: kRed,
              ),
              OutlineButton(
                onPressed: () => onPress(choices[2],question.definition1),
                borderSide: BorderSide(color: kRed,width: 2.0),
                child: Text(choices[2]),
                splashColor: kRed,
              ),
              OutlineButton(
                onPressed: () => onPress(choices[3],question.definition1),
                borderSide: BorderSide(color: kRed,width: 2.0),
                child: Text(choices[3]),
                splashColor: kRed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
