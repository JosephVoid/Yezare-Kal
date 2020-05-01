import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../models/word.dart';
import 'dart:async';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  static String id = "splash_screen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Word> words;
  bool isJsonDone = false;
  bool isAnimDone = false;

  @override
  void initState() {
    loaderFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(

        ),
      ),
    );
  }

  Future jsonBuilder() async {
    String aJson = await rootBundle.loadString('assets/json/dictionary.json');
    words = await (jsonDecode(aJson) as List).map( (i) => Word.fromJson(i) ).toList();
    isJsonDone = true;
  }

  void animRunner() async{
    await Future.delayed(Duration(seconds: 3));
    isAnimDone = true;
  }

  Future loaderFunc() async {
    await jsonBuilder();
    await animRunner();
    if(isAnimDone && isJsonDone){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppBody(words: words),
          ));
    }

  }

}
