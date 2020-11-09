import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/widgets/widget.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: HelpBody(),
    );
  }
}

var _appBar = AppBar(
  title: Text("Pusat Bantuan",
    style: TextStyle(
        color: cDarkGreen
    ),),
  backgroundColor: Colors.white,
  elevation: 0,
  bottomOpacity: 0,
);

class HelpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        ListTileHelp(
            title: "Melakukan Survey IDM",
            onTap: (){}
        ),

        ListTileHelp(
            title: "Melakukan Survey IPD",
            onTap: (){}
        ),

        ListTileHelp(
            title: "Melakukan Survey PD",
            onTap: (){}
        ),

        ListTileHelp(
            title: "Melihat Indeks Desa",
            onTap: (){}
        )
      ],
    );
  }
}

