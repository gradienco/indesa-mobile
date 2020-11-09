import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/data/qna/idm_question_answer_data.dart';
import 'package:indesa_beta/models/answer/answer.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/widgets/widget.dart';

import 'result_page.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {

  QNA _qna = QNA();
  bool _iamSure = false;
  int _totalScore = 0;
  int _questionIndex = 0;
  int _selectedValue = 6;
  int _unAnsweredQuestion = 0;
  bool _isAnsweredAll = true;
  Answer answer;
  List<Answer> answers = List();

  @override
  void initState() {
    for(int i = 0; i<= _qna.listQNA.length ; i++){
      answers.add(Answer(i,6));
      print("jawaban sementara untuk soal ke- ${i+1} berhasil ditambah");
    }
    super.initState();
  }

  void showWarningDialog(BuildContext context, int unAnsweredQuestion){
    var alertDialog = AlertDialog(
      actions: [

        FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          color: cDarkGreen,
          child: Text(
            "Oke",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        )
      ],
      content: Container(
        height: 75,
        child: Text(
          "Terdapat $unAnsweredQuestion pertanyaan yang belum dijawab, mohon jawab semua pertanyaan untuk melanjutkan",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: cDarkGreen
          ),
        ),
      ),
    );

    showDialog(context: context, builder: (BuildContext context) => alertDialog);
  }

  void showAreYouSureDialog(BuildContext context){
    var alertDialog = AlertDialog(
      actions: [
        RaisedButton(
          onPressed: (){

            _iamSure = true;
            Navigator.pop(context);
            print("total skor : ${_totalScore}");
            _onNext();

          },
          color: Colors.green,
          child: Text(
            "IYA",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),

        RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.red,
          child: Text(
            "TIDAK",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        )
      ],
      content: Container(
        height: 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.help,
              color: cDarkGreen,
              size: 140,
            ),

            Text(
              "Apakah Anda yakin dengan jawaban Anda?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: cDarkGreen
              ),
            )
          ],
        ),
      ),
    );

    showDialog(context: context, builder: (BuildContext context) => alertDialog);
  }

  void _onSelectAnswer(int value){
    setState(() {
      _selectedValue = value;
      answers[_questionIndex].value = _selectedValue;
    });
  }

  void _onNext(){
    _isAnsweredAll = true;
    if(_questionIndex+1 == _qna.listQNA.length){

      if(_iamSure) {
        _next();
      } else {

        //menghitung skor sekaligus mengecek apakah terdapat soal yang belum terjawab dan menghitungnya
        _unAnsweredQuestion = 0;
        for(int i = 0; i < answers.length-1 ; i++){

          if(answers[i].value == 6){
            print("soal ke - ${i+1} belum terjawab");
            _unAnsweredQuestion += 1;
            _isAnsweredAll = false;
          }

          print("menambahkan nilai soal ke - ${i+1}");
          _totalScore += answers[i].value;
        }

        //jika terdapat soal yang belum dijawab maka tampilkan warning dialog
        if (!_isAnsweredAll){
          _totalScore = 0;
          // showWarningDialog(context, _unAnsweredQuestion);
          DialogBox().showWarningDialog(context, _unAnsweredQuestion);
        } else {
          showAreYouSureDialog(context);
          print("$_unAnsweredQuestion belum terjawab");
        }

      }

    } else {
      _next();
    }

  }

  void _next(){

    print("get val ($_questionIndex) : ${getValue(_questionIndex)}");
    //  _totalScore += _selectedValue;
    setState(() {
      print("selected value = $_selectedValue");
      setValue(_questionIndex, _selectedValue);
      _questionIndex ++;
      _selectedValue = getValue(_questionIndex);

    });

    //   print("total skor : ${_totalScore}");
    print("value soal ke - ${_questionIndex} : ${answers[_questionIndex-1].value}");

  }

  void _onPrevious(){

    if(_questionIndex == 0){
      print("gabisa prev woy!");
    } else {
      print("get val ($_questionIndex) : ${getValue(_questionIndex)}");
      setState(() {
        print("selected value = $_selectedValue");
        setValue(_questionIndex, _selectedValue);
        _questionIndex --;
        _selectedValue = getValue(_questionIndex);
      });
      //   print("total skor : ${_totalScore}");
      print("value soal ke - ${_questionIndex+2} : ${answers[_questionIndex+1].value}");
      print("jumlah jawaban : ${answers.length}");
    }
  }

  int getValue(int i){
    return answers[i].value;
  }

  void setValue(int i, int v) {
    answers[i].questionNumber = _questionIndex+1;
    answers[i].value = v;
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Ingin keluar dari survey?', style: TextStyle(color: cDarkGreen),),
        content: new Text('Anda belum menyelesaikan survey ini'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("TIDAK",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: setFontSize(47),
              ),),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(RouterGenerator.routeDashboard);
            },
            child: Text("IYA",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: setFontSize(47)
            ),),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    setupScreenUtil(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body:
        (_questionIndex<_qna.listQNA.length) ?
        SizedBox.expand(
          child: Container(
            color: cDarkGreen,
            child: Column(
              children: [

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 6, left: deviceWidth() * 0.055),
                    child: Text(
                      "Pertanyaan ${_questionIndex+1}/${_qna.listQNA.length}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),

                ProgressBar(
                  width: deviceWidth() * 0.9,
                  progress: (_questionIndex+1)/_qna.listQNA.length,
                ),

                Container(
                  height: deviceHeight() * 0.8,
                  width: deviceWidth() *0.9,
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Quiz(
                          onChangeValue: _onSelectAnswer,
                          questionIndex: _questionIndex,
                          qna: _qna,
                          selectedValue: _selectedValue,
                          defaultValue: getValue(_questionIndex),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: _onPrevious,
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: cDarkGreen,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            blurRadius: 6,
                                            spreadRadius: 2,
                                            offset: Offset(-2,3)
                                        ),
                                      ]
                                  ),
                                  child: Icon(Icons.keyboard_arrow_left,
                                    color: Colors.white,),
                                ),
                              ),
                              InkWell(
                                onTap: _onNext,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: cDarkGreen,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            blurRadius: 6,
                                            spreadRadius: 2,
                                            offset: Offset(-2, 3)
                                        ),
                                      ]
                                  ),
                                  child: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ) :
        ResultPage(_totalScore),
      ),
    );
  }
}
