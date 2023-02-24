import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

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
var surveyIDM = "Untuk melakukan survei Indeks Desa Membangun (IDM) langkah langkah yang harus dilakukan adalah sebagai berikut: \n1. Masuk ke Beranda kemudian pilih menu Indeks Desa Membangun \n2. Silahkan pilih desa yang ingin Anda survei \n3. Anda sudah dapat melakukan survei IDM. \n\nPanduan pengisian jawaban : \n1. Pilih lah jawaban sesuai dengan kondisi desa yang Anda survei. \n2. Anda akan melihat hasil survei setelah menyelesaikan survei tersebut. \n3. Pada laman hasil survei akan tampil nilai Indeks Ketahanan Sosial, Indeks Ketahanan Lingkungan, Indeks Ketahanan Ekonimi, dan Indeks Desa Membangun. \n4. Setelah melihat hasil survey, silahkan sentuh tombol \"Submit Data Hasil Survei\" untuk menyimpan data ke dalam database.";

List<MyTile> listOfTiles = <MyTile>[
  MyTile(
    'Melakukan Survey IDM',
    <MyTile>[
      MyTile(surveyIDM),
    ],
  ),
  // MyTile(
  //   'Melakukan Survey IPD',
  //   <MyTile>[
  //     MyTile(ex),
  //   ],
  // ),
  // MyTile(
  //   'Melakukan Survey Podes',
  //   <MyTile>[
  //     MyTile(ex),
  //   ],
  // ),
  // MyTile(
  //   'Melihat Indeks Desa',
  //   <MyTile>[
  //     MyTile(ex),
  //   ],
  // ),
];
