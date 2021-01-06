import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/models/models.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:indesa_beta/widgets/widget.dart';
import 'package:sqflite/sqflite.dart';

class ResultHistoryPage extends StatefulWidget {
  //Survey survey;
  int surveyId;
  String namaDesa;
  double isos, iek, il, idm;
  ResultHistoryPage(this.surveyId, this.namaDesa, this.isos, this.iek, this.il, this.idm);

  @override
  _ResultHistoryPageState createState() => _ResultHistoryPageState();
}

class _ResultHistoryPageState extends State<ResultHistoryPage> {

  DatabaseHelper _dbHelper = DatabaseHelper();
  String _answers="";

  void _getSurveyData(int surveyId) {
    final Future<Database> dbFuture = _dbHelper.initializeDatabase();
    dbFuture.then((database){
      Future<Map<String, dynamic>> surveyData = _dbHelper.getSurveyData(surveyId);
      surveyData.then((data){
        setState(() {
          _answers = data['answer'];
          var tagObjsJson = jsonDecode(_answers)['answer'] as List;
          List<Answer> answerObj = tagObjsJson.map((answerObj) => Answer.fromJson(answerObj)).toList();
          Navigator.pushNamed(context, RouterGenerator.routeHistoryQuiz, arguments: answerObj);
          print(_answers);
        });
      });
    });
  }

  String _getCategory(double idm){
    if(idm <= 0.491) {
      return "Sangat Tertinggal";
    }
    if(idm > 0.491 && idm <= 0.599){
      return "Tertinggal";
    }
    if(idm > 0.599 && idm <= 0.707){
      return "Berkembang";
    }
    if(idm > 0.707 && idm <= 0.815){
      return "Maju";
    }
    if(idm > 0.815){
      return "Mandiri";
    }
  }

  @override
  Widget build(BuildContext context) {

    var _category = _getCategory(widget.idm);

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
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.only(top: deviceHeight() * 0.1),
              child: Text(
                "Hasil Survey",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
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
                          offset: Offset(-1, 3)
                      )
                    ]
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.namaDesa}",
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
                        _category,
                        style: TextStyle(
                            fontSize: setFontSize(60),
                            fontWeight: FontWeight.bold
                        ),
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
                onPressed: (){
                  print("submit");
                  // Navigator.pushNamed(context, RouterGenerator.routeHistoryQuiz, arguments: widget.survey.answers);
                  _getSurveyData(widget.surveyId);
                },
                color: cDarkGreen,
                child: Text("Lihat Riwayat Jawaban", style: TextStyle(color: Colors.white),),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: deviceHeight() * 0.52),
            child: Column(
              children: [
                Row(
                  children: [
                    ResultCategory(category: "INDEKS KETAHANAN SOSIAL", score: widget.isos),
                    ResultCategory(category: "INDEKS KETAHANAN EKONOMI", score: widget.iek)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),

                Padding(padding: EdgeInsets.all(10),),

                Row(
                  children: [
                    ResultCategory(category: "INDEKS KETAHANAN LINGKUNGAN", score: widget.il),
                    ResultCategory(category: "INDEKS DESA MEMBANGUN", score: widget.idm)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
