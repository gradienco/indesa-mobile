import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class ListTileHistory extends StatelessWidget {
  String desa, kategori, poinIDM;
  ListTileHistory({
    @required this.poinIDM,
    @required this.kategori,
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
                flex: 3,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    desa,
                    style: TextStyle(
                        color: cDarkGreen,
                        fontSize: setFontSize(45),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              Flexible(
                flex: 2,
                child: Container(),
              ),

              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        poinIDM,
                        style: TextStyle(
                            fontSize: setFontSize(40),
                            color: cDarkGreen,
                        ),
                      ),
                      Text(
                        kategori,
                        style: TextStyle(
                            fontSize: setFontSize(43),
                            color: cDarkGreen,
                          fontWeight: FontWeight.bold
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
