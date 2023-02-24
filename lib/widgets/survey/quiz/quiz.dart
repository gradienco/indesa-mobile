import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/datasource/local/qna/idm_question_answer_data.dart';
import 'package:indesa_beta/widgets/survey/survey.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final Function onChangeValue;
  final QNA qna;
  final int selectedValue;
  final int defaultValue;

  Quiz(
      {@required this.questionIndex,
      @required this.onChangeValue,
      @required this.qna,
      @required this.defaultValue,
      @required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            qna.listQNA[questionIndex]['pertanyaan'],
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: cDarkGreen,
                fontWeight: FontWeight.bold,
                fontSize: setFontSize(50)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(7),
        ),
        ...(qna.listQNA[questionIndex]['jawaban'] as List<Map<String, Object>>)
            .map((data) {
          return RadioButton((val) => onChangeValue(val), data['text'],
              defaultValue, data['score']);
        }).toList(),
        Padding(
          padding: EdgeInsets.all(45),
        ),
      ],
    );
  }
}
