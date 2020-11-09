import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class ListTileProfile extends StatelessWidget {
  String title, subtitle, icon;
  Function onTap;
  ListTileProfile({
    @required this.onTap,
    @required this.title,
    @required this.subtitle,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.only(top: 5),
        child: Image(
          width: 27,
          height: 27,
          image: AssetImage("$imageAssetProfile/$icon.png"),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: cDarkGreen,
            fontSize: setFontSize(35),
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            color: cDarkGreen,
            fontSize: setFontSize(47),
        ),
      ),
    );
  }
}
