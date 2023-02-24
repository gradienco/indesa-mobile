import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/animation/fade_transition.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/models/models.dart';
import 'package:indesa_beta/pages/history/result_history_page.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:indesa_beta/widgets/widget.dart';
import 'package:sqflite/sqflite.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Riwayat Survey",
          style: TextStyle(color: cDarkGreen),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottomOpacity: 0,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _token = "";
  DatabaseHelper _dbHelper = DatabaseHelper();
  List histories;
  bool isLoading = true;
  Survey survey;

  void _getUserData() {
    final Future<Database> dbFuture = _dbHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<Map<String, dynamic>> userData = _dbHelper.getUser();
      userData.then((data) {
        setState(() {
          _token = data['token'];
        });
      });
    });
  }

  // void _getSurveyHistory() {
  //   //, String namaDesa, double isos, double iek, double il, double idm){
  //   final Future<Database> dbFuture = _dbHelper.initializeDatabase();
  //   dbFuture.then((database) {
  //     Future<List<Map<String, dynamic>>> surveyData =
  //         _dbHelper.getSurveyHistories();
  //     surveyData.then((data) {
  //       setState(() {
  //         histories = data;
  //         isLoading = false;
  //         // _answers = data['answer'];
  //         // var tagObjsJson = jsonDecode(_answers)['answer'] as List;
  //         // List<Answer> answerObj = tagObjsJson
  //         //     .map((answerObj) => Answer.fromJson(answerObj))
  //         //     .toList();
  //         // Survey _survey = Survey(
  //         //     data['user_id'],
  //         //     data['desa_id'],
  //         //     data['survey_id'],
  //         //     data['iks'],
  //         //     data['ike'],
  //         //     data['ikl'],
  //         //     data['idm'],
  //         //     answerObj,
  //         //     data['village']);
  //         //  Navigator.pushNamed(context, RouterGenerator.routeHistoryQuiz, arguments: _survey);
  //         // Navigator.push(context, FadeRoute(page: ResultHistoryPage(surveyId, namaDesa, isos, iek, il, idm)));
  //         // Navigator.push(context, FadeRoute(page: ResultHistoryPage(_survey)));
  //         // print(_answers);
  //         print(data);
  //       });
  //     });
  //   });
  // }

  // void _goToResultHistoryPage(Survey survey) {
  //   Navigator.pushNamed(context, RouterGenerator.routeResultHistory,
  //       arguments: survey);
  // }

  void _goToResultHistoryPage(int surveyId, String namaDesa, double isos,
      double iek, double il, double idm) {
    Navigator.push(
        context,
        FadeRoute(
            page: ResultHistoryPage(surveyId, namaDesa, isos, iek, il, idm)));
  }

  @override
  void initState() {
    _getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: histories.length,
            itemBuilder: (BuildContext context, int index) {
              var item = histories[index];
              var tagObjsJson = jsonDecode(item['answer'])['answer'] as List;
              List<Answer> answerObj = tagObjsJson
                  .map((answerObj) => Answer.fromJson(answerObj))
                  .toList();

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

              return Center(
                child: ListTileHistory(
                    poinIDM: item['idm'].toStringAsFixed(3),
                    desa: item['villageName'],
                    kategori: _getCategory(item['idm'].toDouble()),
                    onTap: () {
                      // _
                      // _getSurveyData(item[index]['id']);
                      // survey = Survey(
                      //     item['user_id'],
                      //     item['desa_id'],
                      //     item['survey_id'],
                      //     item['iks'],
                      //     item['ike'],
                      //     item['ikl'],
                      //     item['idm'],
                      //     answerObj,
                      //     item['villageName']);
                      _goToResultHistoryPage(
                          item[index]['id'],
                          item[index]['desa']['namaDesa'],
                          item[index]['poinIs'].toDouble(),
                          item[index]['poinIek'].toDouble(),
                          item[index]['poinIl'].toDouble(),
                          item[index]['poinIdm'].toDouble());
                      // );
                    }),
              );
            });
  }
}
