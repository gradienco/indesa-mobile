import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/models/models.dart';

import 'index_ekonomi.dart';
import 'index_lingkungan.dart';
import 'index_sosial.dart';

class AnswerHistoryPage extends StatefulWidget {
  final List<Answer> answers;
  AnswerHistoryPage(this.answers);

  @override
  _AnswerHistoryPageState createState() => _AnswerHistoryPageState();
}

class _AnswerHistoryPageState extends State<AnswerHistoryPage> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3); //LENGTH = TOTAL TAB YANG AKAN DIBUAT
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Riwayat Jawaban'),
          backgroundColor: cDarkGreen,
          bottom: TabBar(
              controller: controller,
              tabs: <Tab>[
                Tab(text: "Sosial",),
                Tab(text: "Ekonomi",),
                Tab(text: "Lingkungan",),
              ]
          ),
        ),
      body: TabBarView(
          controller: controller,
          children: <Widget>[
            IndexSosial(answers: widget.answers),
            IndexEkonomi(answers: widget.answers),
            IndexLingkungan(answers: widget.answers)
          ]
      ),
    );
  }
}
