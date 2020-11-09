import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class ListTileHistory extends StatelessWidget {
  String date, desa, score;
  ListTileHistory({
    @required this.date,
    @required this.score,
    @required this.desa,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    date,
                    style: TextStyle(
                        color: cDarkGreen,
                        fontSize: setFontSize(45)
                    ),
                  ),
                ),
              ),

              Flexible(
                flex: 1,
                child: Container(),
              ),

              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        desa,
                        style: TextStyle(
                            fontSize: setFontSize(55),
                            color: cDarkGreen,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        score,
                        style: TextStyle(
                            fontSize: setFontSize(40),
                            color: cDarkGreen
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Divider(),
          )
        ],
      ),
    );
  }
}
