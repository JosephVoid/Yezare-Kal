import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';

class Result extends StatefulWidget {
  static String id = "result";
  final int result;
  final int numOfQ;
  final int diff;
  Result({this.result,this.numOfQ,this.diff});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
          title: 'ውጤት',
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
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  ],
                ),
                SizedBox(height:50.0),
                Text(widget.result.toString(),style:
                    TextStyle(
                      fontSize: 200.0,
                      color: kBlueBlack,
                      fontWeight: FontWeight.bold
                    )
                  ,),
                SizedBox(height:30.0),
                Text('ለክፉ አይሰጥም',style:
                  TextStyle(
                    fontSize: 40.0,
                    color: kBlueBlack,
                    fontWeight: FontWeight.w500
                  ),),
                SizedBox(height: 30.0,),
                Container(
                  width: 170.0,
                  decoration: BoxDecoration(
                      color: kRed,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: FlatButton(
                      onPressed: (){},
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.refresh,
                            size: 40.0,
                            color: kWhite,
                          ),
                          SizedBox(width: 10.0,),
                          Text('ድገም',style:
                            TextStyle(
                              color: kWhite,
                              fontSize: 40.0
                            ),),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    )
   );
  }
}
