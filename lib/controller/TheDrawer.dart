import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import 'package:yezarekal/screens/ready_page.dart';
import 'package:yezarekal/screens/settings.dart';
import 'MenuTiles.dart';
import '../screens/dictionary.dart';
import '../main.dart';


class TheDrawer extends StatelessWidget {
  final Pages page;
  TheDrawer({this.page});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: ListView(
                padding: EdgeInsets.only(top: 30.0),
                children: <Widget>[
                  MenuTile(title: "መነሻ", icon: Icons.home,
                    isSelected: page == Pages.HOME ? true : false,
                    onPress: (){
                      if(page != Pages.HOME)
                        Navigator.pushNamed(context, AppBody.id);
                    },
                  ),
                  SizedBox(height: 10),
                  MenuTile(title: "የዛሬ ቃል", icon: Icons.today,
                    isSelected: page == Pages.WOD ? true : false,
                    onPress: (){},
                  ),
                  SizedBox(height: 10),
                  MenuTile(title: "ጥያቄዎች", icon: Icons.lightbulb_outline,
                    isSelected: page == Pages.QUIZ ? true : false,
                    onPress: (){
                      if(page != Pages.QUIZ)
                        Navigator.pushNamed(context, Quiz.id);
                    },
                  ),
                  SizedBox(height: 10),
                  MenuTile(title: "መዝገበ ቃላት", icon: Icons.book,
                    isSelected: page == Pages.DICTIONARY ? true : false,
                    onPress: (){
                      if(page != Pages.DICTIONARY)
                        Navigator.pushNamed(context, Dictionary.id);
                    },
                  ),
                  SizedBox(height: 10),
                  MenuTile(title: "አማራጮች", icon: Icons.settings,
                    isSelected: page == Pages.SETTINGS ? true : false,
                    onPress: (){
                      if(page != Pages.SETTINGS)
                        Navigator.pushNamed(context, Setting.id);
                    },
                  ),
                  SizedBox(height: 10),
                  MenuTile(title: "ስለ ስሪው", icon: Icons.info_outline,
                    isSelected: page == Pages.ABOUT ? true : false,
                    onPress: (){},
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/images/drawer_bg.png'),
                  )
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}
