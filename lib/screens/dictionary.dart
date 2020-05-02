import 'package:flutter/material.dart';
import 'package:yezarekal/screens/words.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';
import '../models/constants.dart';
import '../models/word.dart';
import '../controller/DictionaryItems.dart';

class Dictionary extends StatefulWidget {
  static String id = "dictionary";
  List<Word> words;
  Dictionary({this.words});

  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<Word> listOfWords = widget.words;
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
        appBar: appBar(title: "መዝገበ ቃላት",stateKey: _drawerKey,icon: Icons.menu,countDownTimer: null),
        drawer: SizedBox(
            width: 230,
            child: TheDrawer(page:Pages.DICTIONARY)),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextField(
                      autofocus: false,
                      cursorColor: kBlueBlack,
                      style: TextStyle(fontSize: 20),
                      onChanged: (value){
                      },
                      decoration: kInputdecoration,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 10.0),
                        itemCount: listOfWords.length,
                        itemBuilder: (BuildContext context,int index){
                          return DictionaryItem(title: listOfWords[index].word,word: listOfWords[index],);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
        ),
      ),

    );
  }
}

