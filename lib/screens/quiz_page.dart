import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import '../main.dart';

class QuestionsPage extends StatefulWidget {
  static String id = "quiz_page";

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

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
            countDownTimer: dispTime(timeSeconds: 10)
          ),
          drawer: SizedBox(
            width: 230,
            child: TheDrawer(page: Pages.QUIZ,)
          ),
          body: Container(

          ),
        ),
    );
  }
}
