import 'package:flutter/material.dart';
import '../models/constants.dart';


class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Function onPress;

  MenuTile({this.title,this.icon,this.isSelected,this.onPress});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon,size: 30.0,color: kBlueBlack,),
        title:
          Text(title,
               style: TextStyle(
               color: kBlueBlack,
               fontSize: 30,
               fontWeight: isSelected ? FontWeight.bold : FontWeight.w200
              ),
          ),
      ),
    );
  }
}
