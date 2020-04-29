import 'package:flutter/material.dart';
import 'package:yezarekal/models/constants.dart';
import '../controller/TheAppBar.dart';
import '../controller/TheDrawer.dart';

class Setting extends StatefulWidget {
  static String id = 'settings';
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  String notValue = 'በየቀኑ';
  String langValue = 'Amharic';
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
            title: 'አማራጮች',
            stateKey:_drawerKey,
            icon: Icons.menu,
            countDownTimer: null
        ),
          drawer: SizedBox(
            width: 230,
            child: TheDrawer(page: Pages.SETTINGS,)
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('አስታውስ',style: TextStyle(fontSize: 25.0,color: kBlueBlack),),
                    trailing: DropdownButton<String>(
                      value: notValue,
                      onChanged: (String newValue) {
                        setState(() {
                          notValue = newValue;
                        });
                      },
                      items: <String>['በየቀኑ', 'በየሰዓቱ',]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: TextStyle(fontSize: 25.0,color: kBlueBlack),),
                        );
                      }).toList(),
                    ),
                  ),
                  ListTile(
                    title: Text('ቋናቋ',style: TextStyle(fontSize: 25.0,color: kBlueBlack),),
                    trailing: DropdownButton<String>(
                      value: langValue,
                      onChanged: (String newValue) {
                        setState(() {
                          notValue = newValue;
                        });
                      },
                      items: <String>['Amharic', 'English',]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: TextStyle(fontSize: 25.0,color: kBlueBlack),),
                        );
                      }).toList(),
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
