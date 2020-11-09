import 'package:flutter/material.dart';

class ResultCategory extends StatelessWidget {
  String category;
  int score;
  ResultCategory({
    @required this.category,
    @required this.score
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: Colors.grey)
      ),
      child: Center(
        child: Text(
          "$category \n $score",
          textAlign: TextAlign.center,),
      ),
    );
  }
}
