import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/models/models.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ResultPage extends StatefulWidget {
  int totalScore, iSos, iEk, iL, desaId;
  List<Answer> answers;
  ResultPage(
      this.totalScore, this.iSos, this.iEk, this.iL, this.desaId, this.answers);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  String token = "";
  int userId = 0, tipe = 0;
  GraphQlConfig _config = GraphQlConfig();
  bool _isBusy = false;
  int a = 0;

  void _getUserData() {
    final Future<Database> dbFuture = _dbHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<Map<String, dynamic>> userData = _dbHelper.getUser();
      userData.then((data) {
        setState(() {
          token = data['token'];
          tipe = data['role'];
          userId = data['user_id'];
        });
      });
    });
  }

  @override
  void initState() {
    _getUserData();
    super.initState();
  }

  double _getIndex(int score, int totalQuestion) {
    var index = score / (totalQuestion * 5);
    return index;
  }

  double _getIDM(double isos, double iek, double il) {
    var idm = (isos + iek + il) / 3;
    return idm;
  }

  String _getCategory(double idm) {
    var category = "";
    if (idm <= 0.491) {
      category = "Sangat Tertinggal";
    }
    if (idm > 0.491 && idm <= 0.599) {
      category = "Tertinggal";
    }
    if (idm > 0.599 && idm <= 0.707) {
      category = "Berkembang";
    }
    if (idm > 0.707 && idm <= 0.815) {
      category = "Maju";
    }
    if (idm > 0.815) {
      category = "Mandiri";
    }
    return category;
  }

  @override
  Widget build(BuildContext context) {
    var _iSos = _getIndex(widget.iSos, 38);
    var _iEk = _getIndex(widget.iEk, 12);
    var _iL = _getIndex(widget.iL, 4);
    var _idm = _getIDM(_iSos, _iEk, _iL);
    var _category = _getCategory(_idm);

    charts.Color _getColorWithAlpha(int a) {
      return charts.Color(r: 42, g: 96, b: 73, a: a);
    }

    var data = [
      Idm("IKS", _iSos, _getColorWithAlpha(255)),
      Idm("IKE", _iEk, _getColorWithAlpha(200)),
      Idm("IKL", _iL, _getColorWithAlpha(110))
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

    void _submitDataSurvey() async {
      print(widget.answers.length);
      GraphQLClient _client = _config.clientToQueryAuth(token);
      try {
        setState(() {
          _isBusy = true;
        });
        var result = await _client.mutate(addSurveyOptions(
            userId, widget.desaId, tipe, _iSos, _iEk, _iL, _idm));
        var data = result.data['addSurvey'];
        print('id addsurvey : ${data['id']}');
        var insertData = await _dbHelper.insertSurveyData(Survey(userId,
            widget.desaId, data['id'], _iSos, _iEk, _iL, _idm, widget.answers));
        if (insertData != 0) {
          print('data inserted');
        } else {
          print('insert data failed');
          setState(() {
            _isBusy = false;
          });
        }

        for (int i = 0; i < widget.answers.length - 1; i++) {
          var result = await _client.mutate(addAnswerOptions(
              data['id'], widget.answers[i].id, widget.answers[i].value));
          var dataAddAnswer = result.data['addAnswer'];
          print(dataAddAnswer['id']);
          setState(() {
            a++;
          });
        }

        if (data != null) {
          showToast("Data Survey berhasil disubmit", context);
          Navigator.of(context)
              .pushReplacementNamed(RouterGenerator.routeDashboard);
        } else {
          showToast("Gagal submit data", context);
          setState(() {
            _isBusy = false;
          });
        }
        // bloc.loginSink.add(Status.success);
      } catch (error) {
        debugPrint('$error');
        setState(() {
          _isBusy = false;
        });
      }
    }

    setupScreenUtil(context);
    return !_isBusy
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Container(
                  height: deviceHeight() * 0.33,
                  width: deviceWidth(),
                  color: cDarkGreen,
                ),

                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.only(top: deviceHeight() * 0.1),
                    child: Text(
                      "Hasil Survey",
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
                              "IDM : ${_idm.toStringAsFixed(3)}",
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
                      onPressed: _submitDataSurvey,
                      color: cDarkGreen,
                      child: Text(
                        "Submit Hasil Survey",
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
                  ),
                )

                // Container(
                //   margin: EdgeInsets.only(top: deviceHeight() * 0.52),
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           ResultCategory(category: "INDEKS KETAHANAN SOSIAL", score: _iSos),
                //           ResultCategory(category: "INDEKS KETAHANAN EKONOMI", score: _iEk)
                //         ],
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       ),
                //
                //       Padding(padding: EdgeInsets.all(10),),
                //
                //       Row(
                //         children: [
                //           ResultCategory(category: "INDEKS KETAHANAN LINGKUNGAN", score: _iL),
                //           ResultCategory(category: "INDEKS DESA MEMBANGUN", score: _idm)
                //         ],
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          )
        : Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 60.0),
                  child: Text(
                    "Menyimpan jawaban $a/${widget.answers.length - 1}",
                    style: TextStyle(fontSize: setFontSize(47)),
                  ),
                ),
              )
            ],
          );
  }
}
