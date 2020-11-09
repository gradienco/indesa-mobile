import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class ListTileHelp extends StatelessWidget {
  String title;
  Function onTap;
  ListTileHelp({
    @required this.title,
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: TextStyle(color: cDarkGreen),),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_right, color: cDarkGreen,),
            onPressed: onTap,
          ),
        ),

        Divider()
      ],
    );
  }
}
