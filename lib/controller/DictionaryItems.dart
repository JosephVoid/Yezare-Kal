import 'package:flutter/material.dart';
import '../models/constants.dart';
import '../models/word.dart';
import '../screens/words.dart';

class DictionaryItem extends StatelessWidget {
  final String title;
  final Word word;
  DictionaryItem({this.title,this.word});

  @override
  Widget build(BuildContext context) {
    if (isDivider()){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: <Widget>[
            Text(title[1],style:
              TextStyle(
                color: kBlueBlack,
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Divider(
                      thickness: 2,
                      color: kRed,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
    else{
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: FlatButton(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => Word_page(word: word),
                )
            );
          },
          child: Row(
            children: <Widget>[
              Icon(Icons.lens,size: 10.0,color: kRed),
              SizedBox(width: 20.0,),
              Text(title,style:
              TextStyle(
                fontSize: 25.0,
                color: kBlueBlack,
              ),
              ),
            ],
          ),
        ),
      );
    }
  }
  bool isDivider(){
    if (title[0] == '*')
      return true;
    else
      return false;
  }
}
