import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class RoundedButton extends StatelessWidget {

  final Color color, textColor;
  final String text;
  final Function onPress;
  final double topMargin, horizontalMargin;
  RoundedButton({
    this.text = "MASUK",
    @required this.onPress,
    this.color = cDarkGreen,
    this.textColor = Colors.white,
    @required this.topMargin,
    @required this.horizontalMargin
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: horizontalMargin, right: horizontalMargin, top: topMargin),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          color: color,
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
