import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/data/qna/idm_question_answer_data.dart';
import 'package:indesa_beta/models/answer/answer.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/widgets/widget.dart';

import 'result_page.dart';

class SurveyPage extends StatefulWidget {
  int desaID;
  SurveyPage(this.desaID);

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
  int _iSos = 0, _iL=0, _iEk=0;
  bool _isAnsweredAll = true;
  Answer answer;
  List<Answer> answers = List();

  @override
  void initState() {
    for(int i = 0; i<= _qna.listQNA.length ; i++){
      answers.add(Answer(i,6,0));
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
            print("sosial : $_iSos");
            print("ekonomi : $_iEk");
            print("lingkungan : $_iL");
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
            _totalScore = 0;
            _iEk = 0;
            _iSos = 0;
            _iL = 0;
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

          // if (i <= 1)
          if(i <= 37)
          {
            _iSos += answers[i].value;
          }

          // if (i > 1 && i <= 3)
          if(i > 37 && i <= 49)
          {
            _iEk += answers[i].value;
          }


          // if(i > 3 && i <= 4)
          if(i > 49 && i <= 53)
          {
            _iL += answers[i].value;
          }

          print("menambahkan nilai soal ke - ${i+1}");
          _totalScore += answers[i].value;
        }

        //jika terdapat soal yang belum dijawab maka tampilkan warning dialog
        if (!_isAnsweredAll){
          _totalScore = 0;
          _iSos = 0;
          _iEk = 0;
          _iL = 0;
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

  void setValue(int i, int v, int id) {
    answers[i].questionNumber = _questionIndex+1;
    answers[i].value = v;
    answers[i].id = id;
  }

  void _next(){

    print("get val ($_questionIndex) : ${getValue(_questionIndex)}");
    setState(() {
      print("selected value = $_selectedValue");
      setValue(_questionIndex, _selectedValue, _qna.listQNA[_questionIndex]['id']);
      _questionIndex ++;
      _selectedValue = getValue(_questionIndex);

    });

  }

  void _onPrevious(){

    if(_questionIndex == 0){
      print("can not go to previous");
    } else {
      print("get val ($_questionIndex) : ${getValue(_questionIndex)}");
      setState(() {
        print("selected value = $_selectedValue");
        setValue(_questionIndex, _selectedValue, _qna.listQNA[_questionIndex]['id']);
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
        Container(
          color: cDarkGreen,
          child: ListView(
            children: [

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      bottom: 6,
                      left: deviceWidth() * 0.055
                  ),
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

              Padding(
                padding: EdgeInsets.only(left: deviceWidth()*0.055),
                child: Row(
                  children: [
                    ProgressBar(
                      width: deviceWidth() * 0.75,
                      progress: (_questionIndex+1)/_qna.listQNA.length,
                    ),

                    IconButton(
                      icon: Icon(Icons.apps,
                      color: Colors.white,),
                      onPressed: (){
                        Navigator.pushNamed(context, RouterGenerator.routeHistoryQuiz, arguments: answers);
                      },
                    )
                  ],
                ),
              ),

              Container(
                height: deviceHeight() * 0.8,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: deviceWidth()*0.05),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                            NextPrevButton(
                              icon: Icons.keyboard_arrow_left,
                              onTap: _onPrevious,
                            ),

                            NextPrevButton(
                              icon: Icons.keyboard_arrow_right,
                              onTap: _onNext,
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
        ) :
        ResultPage(
          _totalScore,
          _iSos,
          _iEk,
          _iL,
          widget.desaID,
          answers
        ),
      ),
    );
  }
}
