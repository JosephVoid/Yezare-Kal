import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';
import '../controller/Buttons.dart';
import '../screens/quiz_page.dart';

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
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(
                  child: Text('ይዘጋጁ!',
                    style: TextStyle(
                      color: kBlueBlack,
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[
                    Text('ደቂቃ',
                      style: TextStyle(
                        color: kBlueBlack,
                        fontSize: 30.0
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        QOptionButton(title:"2",value: 2,btnType: Buttons.TIME,onPress: (){},),
                        QOptionButton(title:"5",value: 5,btnType: Buttons.TIME,onPress: (){},),
                        QOptionButton(title:"7",value: 7,btnType: Buttons.TIME,onPress: (){},),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Text('ጥያቄ ክብደት',
                      style: TextStyle(
                          color: kBlueBlack,
                          fontSize: 30.0
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        QOptionButton(title:"ቀላል",btnType: Buttons.DIFFICULTY,onPress: (){},),
                        QOptionButton(title:"መካከል",btnType: Buttons.DIFFICULTY,onPress: (){},),
                        QOptionButton(title:"ከባድ",btnType: Buttons.DIFFICULTY,onPress: (){},),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Text('ጥያቄ ብዛት',
                      style: TextStyle(
                          color: kBlueBlack,
                          fontSize: 30.0
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        QOptionButton(title:"5",value: 5,btnType: Buttons.NUMBER,onPress: (){},),
                        QOptionButton(title:"10",value: 10,btnType: Buttons.NUMBER,onPress: (){},),
                        QOptionButton(title:"15",value: 15,btnType: Buttons.NUMBER,onPress: (){},),
                      ],
                    ),
                    SizedBox(height: 50.0,),
                    Container(
                      decoration: BoxDecoration(
                        color: kBlueBlack,
                        borderRadius: BorderRadius.all(Radius.circular(30.0))
                      ),
                      child: FlatButton(
                        //TODO: Reroute
                        onPressed: (){
                          Navigator.pushNamed(context, QuestionsPage.id);
                        },
                        child: Text('ጀምር',style:
                          TextStyle(
                            color: kWhite,
                            fontSize: 30.0
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
