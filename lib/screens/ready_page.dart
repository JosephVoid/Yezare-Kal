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
  int timeValue;
  int diffValue;
  int numValue;

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
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Radio(
                                value: 2,
                                activeColor: kRed,
                                focusColor: kRed,
                                groupValue: timeValue,
                                onChanged: (value) {
                                  setState(() {
                                    timeValue = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                onTap: (){ setState(() {timeValue = 2;}); },
                                child: Text("2 ደቂቃ",style: TextStyle(fontSize: 25,color: kBlueBlack),)
                              ),
                          ],
                        ),
                      ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Radio(
                                value: 5,
                                activeColor: kRed,
                                focusColor: kRed,
                                autofocus: true,
                                groupValue: timeValue,
                                onChanged: (value) {
                                  setState(() {
                                    timeValue = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                  onTap: (){ setState(() {timeValue = 5;}); },
                                  child: Text("5 ደቂቃ",style: TextStyle(fontSize: 25,color: kBlueBlack),)
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Radio(
                                value: 7,
                                activeColor: kRed,
                                focusColor: kRed,
                                groupValue: timeValue,
                                onChanged: (value) {
                                  setState(() {
                                    timeValue = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                  onTap: (){ setState(() {timeValue = 7;}); },
                                  child: Text("7 ደቂቃ",style: TextStyle(fontSize: 25,color: kBlueBlack),)
                              ),
                            ],
                          ),
                        ),
                    ],
                    ),
                    SizedBox(height: 20.0,),
                    Text('ጥያቄ ክብደት',
                      style: TextStyle(
                          color: kBlueBlack,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Radio(
                                value: 1,
                                activeColor: kRed,
                                focusColor: kRed,
                                groupValue: diffValue,
                                onChanged: (value) {
                                  setState(() {
                                    diffValue = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                  onTap: (){ setState(() {diffValue = 1;}); },
                                  child: Text("ቀላል",style: TextStyle(fontSize: 28,color: kBlueBlack),)
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Radio(
                                value: 2,
                                activeColor: kRed,
                                focusColor: kRed,
                                autofocus: true,
                                groupValue: diffValue,
                                onChanged: (value) {
                                  setState(() {
                                    diffValue = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                  onTap: (){ setState(() {diffValue = 2;}); },
                                  child: Text("መካከል",style: TextStyle(fontSize: 28,color: kBlueBlack),)
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Radio(
                                value: 3,
                                activeColor: kRed,
                                focusColor: kRed,
                                groupValue: diffValue,
                                onChanged: (value) {
                                  setState(() {
                                    diffValue = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                  onTap: (){ setState(() {diffValue = 3;}); },
                                  child: Text("ከባድ",style: TextStyle(fontSize: 28,color: kBlueBlack),)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Text('ጥያቄ ብዛት',
                      style: TextStyle(
                          color: kBlueBlack,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Radio(
                                value: 5,
                                activeColor: kRed,
                                focusColor: kRed,
                                autofocus: true,
                                groupValue: numValue,
                                onChanged: (value) {
                                  setState(() {
                                    numValue = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                  onTap: (){ setState(() {numValue = 5;}); },
                                  child: Text("5 ጥያቄ",style: TextStyle(fontSize: 25,color: kBlueBlack),)
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Radio(
                                value: 10,
                                activeColor: kRed,
                                focusColor: kRed,
                                groupValue: numValue,
                                onChanged: (value) {
                                  setState(() {
                                    numValue = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                  onTap: (){ setState(() {numValue = 10;}); },
                                  child: Text("10 ጥያቄ",style: TextStyle(fontSize: 25,color: kBlueBlack),)
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Radio(
                                value: 15,
                                activeColor: kRed,
                                focusColor: kRed,
                                groupValue: numValue,
                                onChanged: (value) {
                                  setState(() {
                                    numValue = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                  onTap: (){ setState(() {numValue = 15;}); },
                                  child: Text("15 ጥያቄ",style: TextStyle(fontSize: 25,color: kBlueBlack),)
                              ),
                            ],
                          ),
                        ),
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
                          if ( numValue != null && diffValue != null && timeValue != null)
                            Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => QuestionsPage(timeV: timeValue,diffV: diffValue,numV: numValue,),
                                )
                            );
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
