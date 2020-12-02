import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/data/qna/idm_question_answer_data.dart';
import 'package:indesa_beta/models/models.dart';
import 'package:indesa_beta/widgets/survey/history_quiz/history_quiz.dart';

class IndexSosial extends StatelessWidget {

  final List<Answer> answers;
  IndexSosial({
    this.answers
  });

  QNA _qna = QNA();

  @override
  Widget build(BuildContext context) {
    setupScreenUtil(context);
    return Scaffold(
      backgroundColor: cDarkGreen,
      body: ListView.builder(
       itemCount: 38,
        // itemCount: 2,
        itemBuilder: (context, i) {
          return HistoryQuiz(
            questionIndex: i,
            qna: _qna,
            answers: answers,
          );
        },
      ),
    );
  }
}