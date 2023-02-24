import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class RadioButton extends StatelessWidget {

  final int selectedValue;
  final int defaultValue;
  final Function onChangeValue;
  final String answerText;

  RadioButton(
      this.onChangeValue,
      this.answerText,
      this.defaultValue,
      this.selectedValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.only(top: 4, bottom: 4),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(9)
      ),
      child: RadioListTile(
        title: Text(answerText,
          style: TextStyle(
            color: Colors.black,
            fontSize: setFontSize(45)
          )),
        value: selectedValue,
        onChanged: onChangeValue,
        groupValue: defaultValue,
        activeColor: cDarkGreen,
      ),
    );
  }
}
