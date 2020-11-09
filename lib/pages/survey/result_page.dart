import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/widgets/widget.dart';

class ResultPage extends StatelessWidget {
  int totalScore;
  ResultPage(this.totalScore);

  @override
  Widget build(BuildContext context) {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "$totalScore",
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
                        "Desa Berkembang",
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
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed(RouterGenerator.routeDashboard);
                },
                color: cDarkGreen,
                child: Text("Beranda", style: TextStyle(color: Colors.white),),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: deviceHeight() * 0.52),
            child: Column(
              children: [
                Row(
                  children: [
                    ResultCategory(category: "INDEKS KETAHANAN SOSIAL", score: 50),
                    ResultCategory(category: "INDEKS KETAHANAN EKONOMI", score: 76)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),

                Padding(padding: EdgeInsets.all(10),),

                Row(
                  children: [
                    ResultCategory(category: "INDEKS KETAHANAN LINGKUNGAN", score: 33),
                    ResultCategory(category: "INDEKS DESA MEMBANGUN", score: 61)
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
