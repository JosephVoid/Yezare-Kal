import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import '../main.dart';
import 'package:provider/provider.dart';
import 'package:yezarekal/models/word_bank.dart';
import 'package:yezarekal/models/word.dart';
import '../controller/Buttons.dart';

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
  //TODO
  void correct(){
    print("correct");
  }
  Widget dispTime({int timeSeconds}){
    return Center(
      child: CountdownFormatted(
        onFinish: () => Navigator.pushNamed(context, AppBody.id),
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
    int generatedQuestionId = 5;

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text("Word",style:
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
                        //TODO
                        QuestionButton(text: "Answer1",),
                        SizedBox(height: 10.0,),
                        QuestionButton(text: "Answer2",),
                        SizedBox(height: 10.0,),
                        QuestionButton(text: "Answer3",),
                        SizedBox(height: 10.0,),
                        QuestionButton(text: "Answer4",),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("2",style: TextStyle(fontSize: 30.0,color: kBlueBlack),),
                        SizedBox(width: 5.0,),
                        Text("|",style: TextStyle(fontSize: 30.0,color: kBlueBlack),),
                        SizedBox(width: 5.0,),
                        Text("2",style: TextStyle(fontSize: 30.0,color: kBlueBlack),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
