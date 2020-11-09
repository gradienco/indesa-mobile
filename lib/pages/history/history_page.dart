import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/widgets/widget.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: HistoryBody(),
    );
  }
}

var _appBar = AppBar(
  title: Text("Riwayat Survey",
    style: TextStyle(
        color: cDarkGreen
    ),),
  backgroundColor: Colors.white,
  elevation: 0,
  bottomOpacity: 0,
);

class HistoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTileHistory(
            score: "220",
            desa: "Pujodadi",
            date: "09/09/20"
        ),

        ListTileHistory(
            score: "196",
            desa: "Banjar Negeri",
            date: "01/09/20"
        ),

        ListTileHistory(
            score: "132",
            desa: "Branti",
            date: "25/08/20"
        ),

        ListTileHistory(
            score: "202",
            desa: "Bumi Sari",
            date: "14/08/20"
        ),

        ListTileHistory(
            score: "230",
            desa: "Rajabasa",
            date: "10/07/20"
        ),

        ListTileHistory(
            score: "140",
            desa: "Pahoman",
            date: "07/07/20"
        ),

        ListTileHistory(
            score: "230",
            desa: "Teluk",
            date: "17/06/20"
        ),

        ListTileHistory(
            score: "1240",
            desa: "Natar",
            date: "19/08/20"
        ),
        ListTileHistory(
            score: "230",
            desa: "Rajabasa",
            date: "10/07/20"
        ),

        ListTileHistory(
            score: "140",
            desa: "Pahoman",
            date: "07/07/20"
        ),

        ListTileHistory(
            score: "230",
            desa: "Teluk",
            date: "17/06/20"
        ),

        ListTileHistory(
            score: "1240",
            desa: "Natar",
            date: "19/08/20"
        )

      ],
    );
  }
}


