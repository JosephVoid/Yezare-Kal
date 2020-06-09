import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import 'package:yezarekal/screens/results.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yezarekal/models/word_bank.dart';
import 'package:yezarekal/models/word.dart';
import '../controller/AQuestion.dart';

class QuestionsPage extends StatefulWidget {
  static String id = "quiz_page";
  final int timeV;
  final int numV;
  final int diffV;
  QuestionsPage({this.timeV,this.diffV,this.numV});

  @override
  QuestionsPageState createState() => QuestionsPageState();
}

class QuestionsPageState extends State<QuestionsPage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  int score = 0;
  Word currentWord;
  List<Word> GeneratedWords = [];
  int wordPos; // The word position in the array
  bool gate = true;

  // Methods
  // Generate a random word
  void generateWord(int diff,List<Word> listOfWords){
    for (;;){
      int random = Random().nextInt(listOfWords.length);
      if ( listOfWords[random].difficulty == diff && !GeneratedWords.contains(listOfWords[random])){
        GeneratedWords.add(listOfWords[random]);
        setState(() {
          currentWord = GeneratedWords[GeneratedWords.length - 1];
          wordPos = random;
        });
        for(int i = 0; i < GeneratedWords.length; i++)
          print("Generated Words :${GeneratedWords[i].word}");
        break;
      }
      else continue;
    }
  }
  // Generate the next question
  void nextQ(List<Word> listOfWords) {
    if (GeneratedWords.length <= widget.numV)
      generateWord(widget.diffV,listOfWords);
    else {
      Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => Result(result: score,numOfQ: widget.numV,),
          )
      );
    }
  }
  // Generate the next question if correct
  void correctNextQ(List<Word> listOfWords){
    setState(() {
      score += 1;
    });
    nextQ(listOfWords);
  }
  // Generate the next question if wrong
  void wrongNextQ(List<Word> listOfWords){
    nextQ(listOfWords);
  }
  // Make a timer widget
  Widget dispTime({int timeSeconds}){
    return Center(
      child: CountdownFormatted(
        onFinish: () {
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => Result(result: score,numOfQ: widget.numV,diff:widget.diffV),
              )
          );
        },
        duration: Duration(seconds: timeSeconds),
        builder: (BuildContext ctx, String remaining) {
          return Text(remaining,style: TextStyle(fontSize: 25.0,color: kBlueBlack),); // 01:00:00
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Word> listOfWords = Provider.of<WordBank>(context).WORDS;
    Function checker = (String choice, String answer){ choice == answer ? correctNextQ(listOfWords) : wrongNextQ(listOfWords); }; // Choice checker

    if(gate){ generateWord(widget.diffV,listOfWords); gate = false; } // Generate the first word

    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.fill,
          )
        ),
        child: Scaffold(
        key: _drawerKey,
        backgroundColor: kWhite.withOpacity(0),
          appBar: appBar(
            title: 'ጥያቄዎች',
            stateKey:_drawerKey,
            icon: Icons.menu,
            countDownTimer: dispTime(timeSeconds: widget.timeV * 60)
          ),
          drawer: SizedBox(
            width: 230,
            child: TheDrawer(page: Pages.QUIZ,)
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: AQuestion(question: currentWord,answerPos: wordPos,words: listOfWords,onPress: checker,), // The Main Questions
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(score.toString(),style: TextStyle(fontSize: 30.0,color: Colors.green.shade700),),
                        SizedBox(width: 5.0,),
                        Text("|",style: TextStyle(fontSize: 30.0,color: kBlueBlack),),
                        SizedBox(width: 5.0,),
                        Text((GeneratedWords.length - 1).toString(),style: TextStyle(fontSize: 30.0,color: kBlueBlack),)
                      ],
                    ),
                  )
                ],
              )
            ),
          ),
        ),
    );
  }
}
