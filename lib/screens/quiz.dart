import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';

class Quiz extends StatefulWidget {
  static String id = "quiz";
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
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
          title: 'ጥያቄዎች',
          stateKey:_drawerKey,
          icon: Icons.menu,
          countDownTimer: null
        ),
        drawer: SizedBox(
          width: 230,
          child: TheDrawer(page: Pages.QUIZ,)
        ),
      )
    );
  }
}
