import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'controller/TheAppBar.dart';
import 'models/constants.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'controller/TheDrawer.dart';
import 'screens/dictionary.dart';
import 'screens/quiz.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        home: AppBody(),
        routes: {
          Dictionary.id : (context) => Dictionary(),
          Quiz.id : (context) => Quiz(),
          AppBody.id : (context) => AppBody(),
        },
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  static String id = "home";
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> with SingleTickerProviderStateMixin{

  SequenceAnimation sequenceAnimation;
  AnimationController controller;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<Offset>(
            begin: const Offset(0, 600),
            end: const Offset(0, 0),
          ),
          from: Duration(milliseconds: 0), to: Duration(milliseconds: 1000),
          tag: "WOD",
          curve: Curves.ease,
        ).addAnimatable(
        animatable: Tween<Offset>(
          begin: const Offset(0, 400),
          end: const Offset(0, 0),
        ),
        from: Duration(milliseconds: 0), to: Duration(milliseconds: 1000),
        tag: "DIC",
        curve: Curves.ease,
        ).addAnimatable(
        animatable: Tween<Offset>(
          begin: const Offset(0, 200),
          end: const Offset(0, 0),
        ),
        from: Duration(milliseconds: 0), to: Duration(milliseconds: 1000),
        tag: "QUZ",
        curve: Curves.ease,
        ).animate(controller);
        controller.forward();
    super.initState();
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
            title: 'መነሻ',
            stateKey:_drawerKey,
            icon: Icons.menu,
            countDownTimer: null
        ),
        drawer: SizedBox(
          width: 230,
          child: TheDrawer(page: Pages.HOME,)
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context,child){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Transform.translate(
                        offset: sequenceAnimation["WOD"].value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:30.0),
                          child: FlatButton(
                            onPressed: (){},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kBlueBlack,
                                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                              ),
                              child: Center(
                                child: Text(
                                  'የዛሬ ቃል',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontSize: 60.0,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Transform.translate(
                        offset: sequenceAnimation["DIC"].value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:30.0),
                          child: FlatButton(
                            onPressed: (){
                              Navigator.pushNamed(context, Quiz.id);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                              ),
                              child: Center(
                                child: Text(
                                  'ጥያቄዎች',
                                  style: TextStyle(
                                      color: kBlueBlack,
                                      fontSize: 60.0,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Transform.translate(
                        offset: sequenceAnimation["QUZ"].value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:30.0),
                          child: FlatButton(
                            onPressed: (){
                              Navigator.pushNamed(context, Dictionary.id);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kRed,
                                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                              ),
                              child: Center(
                                child: Text(
                                  'መዝገበ ቃላት',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontSize: 60.0,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}


