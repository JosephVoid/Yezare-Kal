import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';
import '../models/word.dart';

class Word_page extends StatefulWidget {
  static String id = "word";
  Word word;
  Word_page({this.word});

  @override
  _Word_pageState createState() => _Word_pageState();
}

class _Word_pageState extends State<Word_page> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Word theWord = widget.word;
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
            title: 'ቃል',
            stateKey:_drawerKey,
            icon: Icons.menu,
            countDownTimer: null
          ),
          drawer: SizedBox(
            width: 230,
            child: TheDrawer()
            ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(theWord.word,style:
                      TextStyle(
                        fontSize: 60.0,
                        color: kBlueBlack,
                        fontWeight: FontWeight.bold
                      )
                    ,),
                  Text('(${theWord.translation})',style:
                      TextStyle(
                        color: kRed,
                        fontSize: 20.0
                      )
                    ,),
                  SizedBox(height: 30.0),
                  Text(theWord.definition1,style:
                      TextStyle(
                        fontSize: 25.0,
                        color: kBlueBlack
                      )
                    ,),

                  SizedBox(height: 30.0),
                  Text('ምሳሌ',style:
                      TextStyle(
                        color: kBlueBlack,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      )
                    ,),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('1) ${theWord.example}',style:
                    TextStyle(
                        fontSize: 20.0,
                        color: kBlueBlack
                    )
                      ,),
                  ),
                ],
              ),
            ),
          ),
          )
    );
  }
}
