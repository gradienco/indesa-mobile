import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/widgets/widget.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pusat Bantuan",
          style: TextStyle(
              color: cDarkGreen
          ),),
        backgroundColor: Colors.white,
        elevation: 0,
        bottomOpacity: 0,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return StuffInTiles(listOfTiles[index]);
        },
        itemCount: listOfTiles.length,
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final MyTile myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty)
      return ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => print("tap"),
          selected: true,
          title: Text(t.title,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: setFontSize(45),
            ),
          ));

    return ExpansionTile(
      key: PageStorageKey<int>(3),
      title: Text(t.title,
        style: TextStyle(
          color: cDarkGreen,
          fontSize: setFontSize(50)
        ),
      ),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}

class MyTile {
  String title;
  List<MyTile> children;
  MyTile(this.title, [this.children = const <MyTile>[]]);
}

var ex = "Uniquely leverage other's best-of-breed niche markets whereas world-class deliverables. Authoritatively parallel task multidisciplinary total linkage through user-centric benefits. Rapidiously restore B2C technologies whereas global functionalities. Credibly transition e-business methodologies after dynamic action items.";

List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
    'Melakukan Survey IDM',
    <MyTile>[
      new MyTile(ex),
    ],
  ),
  new MyTile(
    'Melakukan Survey IPD',
    <MyTile>[
      new MyTile(ex),
    ],
  ),
  new MyTile(
    'Melakukan Survey Podes',
    <MyTile>[
      new MyTile(ex),
    ],
  ),
  new MyTile(
    'Melihat Indeks Desa',
    <MyTile>[
      new MyTile(ex),
    ],
  ),
];
