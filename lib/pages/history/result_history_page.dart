import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/models/models.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ResultHistoryPage extends StatefulWidget {
  //Survey survey;
  int surveyId;
  String namaDesa;
  double isos, iek, il, idm;
  ResultHistoryPage(
      this.surveyId, this.namaDesa, this.isos, this.iek, this.il, this.idm);

  @override
  _ResultHistoryPageState createState() => _ResultHistoryPageState();
}

class _ResultHistoryPageState extends State<ResultHistoryPage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  GraphQlConfig _config = GraphQlConfig();
  String _answers = "";
  List<Answer> _listAnswer = List();

  @override
  void initState() {
    for (int i = 0; i <= 54; i++) {
      _listAnswer.add(Answer(i, 6, 0));
      print("jawaban sementara untuk soal ke- ${i + 1} berhasil ditambah");
    }
    super.initState();
  }

  void _getSurveyData(int surveyId) {
    final Future<Database> dbFuture = _dbHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<Map<String, dynamic>> surveyData =
          _dbHelper.getSurveyData(surveyId);
      surveyData.then((data) {
        setState(() {
          _answers = data['answer'];
          var tagObjsJson = jsonDecode(_answers)['answer'] as List;
          List<Answer> answerObj = tagObjsJson
              .map((answerObj) => Answer.fromJson(answerObj))
              .toList();
          Navigator.pushNamed(context, RouterGenerator.routeHistoryQuiz,
              arguments: answerObj);
          print(_answers);
        });
      });
    });
  }

  // void _getAnswerHistory(int surveyId) async {
  //   GraphQLClient _client = _config.clientToQuery();
  //   try {
  //     var result = await _client.query(getAnswer(surveyId));
  //     var data = result.data['penilaian'];
  //     String json = jsonEncode(data);
  //     var tagObjsJson = jsonDecode(json) as List;

  //     for (int i = 0; i < tagObjsJson.length; i++) {
  //       // _listAnswer.add(Answer(i+1, tagObjsJson[i]['nilai'], tagObjsJson[i]['id']));
  //       _listAnswer[i].questionNumber = i + 1;
  //       _listAnswer[i].value = tagObjsJson[i]['nilai'];
  //       _listAnswer[i].id = tagObjsJson[i]['id'];
  //     }

  //     Navigator.pushNamed(context, RouterGenerator.routeHistoryQuiz,
  //         arguments: _listAnswer);
  //   } catch (error) {
  //     debugPrint('$error');
  //   }
  // }

  String _getCategory(double idm) {
    if (idm <= 0.491) {
      return "Sangat Tertinggal";
    }
    if (idm > 0.491 && idm <= 0.599) {
      return "Tertinggal";
    }
    if (idm > 0.599 && idm <= 0.707) {
      return "Berkembang";
    }
    if (idm > 0.707 && idm <= 0.815) {
      return "Maju";
    }
    if (idm > 0.815) {
      return "Mandiri";
    }
  }

  @override
  Widget build(BuildContext context) {
    var _category = _getCategory(widget.idm);

    charts.Color _getColorWithAlpha(int a) {
      return charts.Color(r: 42, g: 96, b: 73, a: a);
    }

    var data = [
      Idm("IKS", widget.isos, _getColorWithAlpha(255)),
      Idm("IKE", widget.iek, _getColorWithAlpha(200)),
      Idm("IKL", widget.il, _getColorWithAlpha(110))
    ];

    var series = [
      charts.Series(
          domainFn: (Idm idm, _) => idm.type,
          measureFn: (Idm idm, _) => idm.indeks,
          colorFn: (Idm idm, _) => idm.color,
          id: 'Idm',
          data: data,
          labelAccessorFn: (Idm idm, _) =>
              '${idm.type} : ${idm.indeks.toStringAsFixed(3)}',
          insideLabelStyleAccessorFn: (Idm idm, _) => (charts.TextStyleSpec(
              color: charts.Color(
                a: 255,
                b: 255,
                g: 255,
                r: 255,
              ),
              fontSize: setFontSize(39).toInt())))
    ];

    var chart = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(
          arcRendererDecorators: [charts.ArcLabelDecorator()]),
    );

    setupScreenUtil(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: deviceHeight() * 0.33,
            width: deviceWidth(),
            color: cDarkGreen,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  top: deviceHeight() * 0.05, left: deviceWidth() * 0.03),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.only(top: deviceHeight() * 0.1),
              child: Text(
                "${widget.namaDesa}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: deviceHeight() * 0.2),
              child: Container(
                width: deviceWidth() * 0.83,
                height: deviceHeight() * 0.28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: cLightGrey,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 4,
                          spreadRadius: 4,
                          offset: Offset(-1, 3))
                    ]),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "IDM : ${widget.idm.toStringAsFixed(3)}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: setFontSize(85),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3),
                      ),
                      Text(
                        'Kategori : $_category',
                        style: TextStyle(
                            fontSize: setFontSize(60),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  _getSurveyData(widget.surveyId);
                  // _getAnswerHistory(widget.survey.surveyId);
                  // Navigator.pushNamed(context, RouterGenerator.routeHistoryQuiz,
                  //     arguments: widget.survey.answers);
                },
                color: cDarkGreen,
                child: Text(
                  "Lihat Riwayat Jawaban",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: deviceHeight() * 0.4),
              child: SizedBox(
                height: deviceWidth() * 0.67,
                child: chart,
              ),

              // child: Column(
              //   children: [
              //     Row(
              //       children: [
              //         ResultCategory(category: "INDEKS KETAHANAN SOSIAL", score: widget.isos),
              //         ResultCategory(category: "INDEKS KETAHANAN EKONOMI", score: widget.iek)
              //       ],
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     ),
              //
              //     Padding(padding: EdgeInsets.all(10),),
              //
              //     Row(
              //       children: [
              //         ResultCategory(category: "INDEKS KETAHANAN LINGKUNGAN", score: widget.il),
              //         ResultCategory(category: "INDEKS DESA MEMBANGUN", score: widget.idm)
              //       ],
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     ),
              //   ],
              // ),
            ),
          )
        ],
      ),
    );
  }
}
