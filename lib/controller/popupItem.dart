import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/constants.dart';
import '../models/word.dart';
import '../screens/words.dart';

class PopupItem extends StatelessWidget {
  final Word word;
  PopupItem({this.word});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      child: FlatButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => Word_page(word: word),
              )
          );
        },
        child: Text(word.word,style:
        TextStyle(
            color: kBlueBlack,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
        ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
