import 'package:flutter/material.dart';
import 'package:yezarekal/models/word.dart';

class WordBank extends ChangeNotifier{
  List<Word> WORDS;

  void intializeBank(List<Word> words){
    WORDS = words;
    notifyListeners();
  }
}