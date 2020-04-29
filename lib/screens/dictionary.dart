import 'package:flutter/material.dart';
import 'package:yezarekal/screens/words.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';
import '../models/constants.dart';

class Dictionary extends StatefulWidget {
  static String id = "dictionary";
  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
                    child: ListView(
                      padding: const EdgeInsets.only(top: 30.0),
                      children: <Widget>[
                        FlatButton(
                            child: Text("i am waiting for you..you cant deny me"),
                            onPressed: (){
                              Navigator.pushNamed(context, Word.id);
                            },
                        )
                      ],
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

