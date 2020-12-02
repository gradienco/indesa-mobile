import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/models/models.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:indesa_beta/widgets/widget.dart';
import 'package:sqflite/sqflite.dart';

class ResultPage extends StatefulWidget {
  int totalScore, iSos, iEk, iL, desaId;
  List<Answer> answers;
  ResultPage(this.totalScore, this.iSos, this.iEk, this.iL, this.desaId, this.answers);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  DatabaseHelper _dbHelper = DatabaseHelper();
  String token ="";
  int userId = 0,tipe=0;
  GraphQlConfig _config = GraphQlConfig();
  bool _isBusy = false;

  void _getUserData(){
    final Future<Database> dbFuture = _dbHelper.initializeDatabase();
    dbFuture.then((database){
      Future<Map<String, dynamic>> userData = _dbHelper.getUser();
      userData.then((data){
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

  double _getIndex(int score, int totalQuestion){
    var index = score/(totalQuestion*5);
    return index;
  }

  double _getIDM(double isos, double iek, double il){
    var idm = (isos + iek + il)/3;
    return idm;
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

    var _iSos = _getIndex(widget.iSos, 38);
    var _iEk = _getIndex(widget.iEk, 12);
    var _iL = _getIndex(widget.iL, 4);
    var _idm = _getIDM(_iSos, _iEk, _iL);
    var _category = _getCategory(_idm);

    void _submitDataSurvey() async {
      GraphQLClient _client =_config.clientToQueryAuth(token);
      try {
        setState(() {
          _isBusy = true;
        });
        var result = await _client.mutate(addSurveyOptions(userId, widget.desaId, tipe, _iSos, _iEk, _iL, _idm));
        var data = result.data['addSurvey'];
        print('id addsurvey : ${data['id']}');
        var insertData = await _dbHelper.insertSurveyData(
          Survey(
            userId,
            widget.desaId,
            data['id'],
            _iSos,
            _iEk,
            _iL,
            _idm,
            widget.answers
          )
        );
        if (insertData != 0) {
          print('data inserted');
        } else {
          print('insert data failed');
          setState(() {
            _isBusy = false;
          });
        }
        if(data != null){
          showToast("Data Survey berhasil disubmit", context);
          Navigator.of(context).pushReplacementNamed(RouterGenerator.routeDashboard);
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
    return !_isBusy ? Scaffold(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${widget.totalScore}",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Points",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),

                      Text(
                        _category,
                        style: TextStyle(
                            fontSize: 20,
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
                onPressed: _submitDataSurvey,
                color: cDarkGreen,
                child: Text("Submit Hasil Survey", style: TextStyle(color: Colors.white),),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: deviceHeight() * 0.52),
            child: Column(
              children: [
                Row(
                  children: [
                    ResultCategory(category: "INDEKS KETAHANAN SOSIAL", score: _iSos),
                    ResultCategory(category: "INDEKS KETAHANAN EKONOMI", score: _iEk)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),

                Padding(padding: EdgeInsets.all(10),),

                Row(
                  children: [
                    ResultCategory(category: "INDEKS KETAHANAN LINGKUNGAN", score: _iL),
                    ResultCategory(category: "INDEKS DESA MEMBANGUN", score: _idm)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ],
            ),
          )
        ],
      ),
    ) : Center(
      child: CircularProgressIndicator(),
    );
  }
}
