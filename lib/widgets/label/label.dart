import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class Label extends StatelessWidget {
  String totalSurvey;
  Label({
    @required this.totalSurvey
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Color(0xFFE4E4E4), borderRadius: BorderRadius.circular(8)),
        child: Text(
          "$totalSurvey survey",
          style: TextStyle(
              color: cDarkGreen, fontSize: setFontSize(35), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
