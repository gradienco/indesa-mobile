import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/datasource/local/qna/idm_question_answer_data.dart';
import 'package:indesa_beta/models/models.dart';
import 'package:indesa_beta/widgets/survey/history_quiz/history_quiz.dart';

class IndexLingkungan extends StatelessWidget {
  final List<Answer> answers;
  IndexLingkungan({this.answers});

  QNA _qna = QNA();

  @override
  Widget build(BuildContext context) {
    setupScreenUtil(context);
    return Scaffold(
      backgroundColor: cDarkGreen,
      body: ListView.builder(
        // itemCount: 1,
        itemCount: 4,
        itemBuilder: (context, i) {
          return HistoryQuiz(
            // questionIndex: i+4,
            questionIndex: i + 50,
            qna: _qna,
            answers: answers,
          );
        },
      ),
    );
  }
}
