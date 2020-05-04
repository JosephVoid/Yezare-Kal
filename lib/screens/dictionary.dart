import 'package:flutter/material.dart';
import 'package:search_widget/search_widget.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';
import '../models/constants.dart';
import '../models/word.dart';
import '../controller/DictionaryItems.dart';
import '../controller/popupItem.dart';
import '../models/word_bank.dart';
import 'package:provider/provider.dart';

class Dictionary extends StatefulWidget {
  static String id = "dictionary";

  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  bool filter({Word word, String query}){
    if ( word.translation.contains( query.toLowerCase() ) && !word.word.contains("*") )
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    List<Word> listOfWords = Provider.of<WordBank>(context).WORDS;
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
                    child: SearchWidget<Word>(
                      dataList: listOfWords,
                      hideSearchBoxWhenItemSelected: false,
                      listContainerHeight: MediaQuery.of(context).size.height / 4,
                      queryBuilder: (String query, List<Word> list) {
                        return list.where(
                                (item) => filter(word: item , query: query.toLowerCase())
                        ).toList();
                      },
                      popupListItemBuilder: (Word item) {
                        return !item.word.contains("*") ? PopupItem(word:item) : SizedBox(height: 0,);
                      },
                      selectedItemBuilder: (Word selectedItem, VoidCallback deleteSelectedItem) {
                        return null;
                      },
                      noItemsFoundWidget: Text('No Words found'),
                      textFieldBuilder: (TextEditingController controller, FocusNode focusNode) {
                       return TextField(
                         controller: controller,
                          focusNode: focusNode,
                          autofocus: false,
                          cursorColor: kBlueBlack,
                          style: TextStyle(fontSize: 20),
                          onChanged: (value){},
                          decoration: kInputdecoration,
                        );
                      }
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 10.0),
                        itemCount: listOfWords.length,
                        itemBuilder: (BuildContext context,int index){
                          return DictionaryItem(title: listOfWords[index].word,word: listOfWords[index],);
                        },
                      ),
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

