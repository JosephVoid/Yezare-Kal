import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';

class Word extends StatefulWidget {
  static String id = "word";
  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<Word> {
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
                  Text('Sample',style:
                      TextStyle(
                        fontSize: 60.0,
                        color: kBlueBlack,
                        fontWeight: FontWeight.bold
                      )
                    ,),
                  Text('(Sample translation)',style:
                      TextStyle(
                        color: kRed,
                        fontSize: 20.0
                      )
                    ,),
                  SizedBox(height: 30.0),
                  Text('1) Lorem Lored loredm Lored loredadf asddfsm',style:
                      TextStyle(
                        fontSize: 25.0,
                        color: kBlueBlack
                      )
                    ,),
                  SizedBox(height: 10.0),
                  Text('2) Lorem Lored loredm Lored loredadf asddfsm',style:
                  TextStyle(
                      fontSize: 25.0,
                      color: kBlueBlack
                  )
                    ,),
                  SizedBox(height: 30.0),
                  Text('Misale',style:
                      TextStyle(
                        color: kBlueBlack,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      )
                    ,),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('1) Lorem Lored loredm Lored loredadf asddfsm',style:
                    TextStyle(
                        fontSize: 20.0,
                        color: kBlueBlack
                    )
                      ,),
                  ),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('2) Lorem Lored loredm Lored loredadf asddfsm',style:
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
