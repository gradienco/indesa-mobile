import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/datasource/local/qna/idm_question_answer_data.dart';
import 'package:indesa_beta/models/models.dart';

class HistoryQuiz extends StatelessWidget {
  final int questionIndex;
  final QNA qna;
  final List<Answer> answers;
  HistoryQuiz({
    @required this.questionIndex,
    @required this.qna,
    @required this.answers,
  });

  int _getAnswerIndex(int value) {
    switch (value) {
      case 0:
        return 5;
        break;
      case 1:
        return 4;
        break;
      case 2:
        return 3;
        break;
      case 3:
        return 2;
        break;
      case 4:
        return 1;
        break;
      case 5:
        return 0;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> answerText;
    answerText = qna.listQNA[questionIndex]['jawaban'];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(10),
      // height: 150,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              "${questionIndex + 1}. ${qna.listQNA[questionIndex]['pertanyaan']}",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: (answers[questionIndex].value > 5)
                      ? Colors.red
                      : cDarkGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: setFontSize(50)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          Container(
            padding: EdgeInsets.all(1),
            margin: EdgeInsets.only(top: 4, bottom: 4),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(9)),
            child: RadioListTile(
              title: Text((answers[questionIndex].value > 5)
                  ? "Belum dijawab"
                  : answerText[_getAnswerIndex(answers[questionIndex].value)]
                      ['text']),
              onChanged: (val) {},
              groupValue: 1,
              value: 1,
              activeColor:
                  (answers[questionIndex].value > 5) ? Colors.red : cDarkGreen,
            ),
          ),
        ],
      ),
    );
  }
}
