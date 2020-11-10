import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class ListTileLocation extends StatelessWidget {
  Function onTap;
  String location;
  ListTileLocation({
    @required this.onTap,
    @required this.location
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap:onTap,
          title: Text(
            location,
            style: TextStyle(
                color: cDarkGreen,
                fontSize: setFontSize(50),
                fontWeight: FontWeight.bold
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            color: cDarkGreen,
            onPressed: (){},
          ),
        ),

        Divider()
      ],
    );
  }
}
