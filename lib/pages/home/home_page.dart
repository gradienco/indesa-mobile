import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:indesa_beta/widgets/widget.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DatabaseHelper _dbHelper = DatabaseHelper();
  String nama ="";

  void _getUserData(){
    final Future<Database> dbFuture = _dbHelper.initializeDatabase();
    dbFuture.then((database){
      Future<Map<String, dynamic>> userData = _dbHelper.getUser();
      userData.then((data){
        setState(() {
          nama = data['nama_lengkap'];
        });
      });
    });
  }

  void _showToastComingSoon(BuildContext context){
    showToast("Coming soon", context);
  }

  @override
  void initState() {
    _getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 56, bottom: 7, left: deviceWidth() * 0.06),
            child: Text(
              "Selamat Datang,",
              style: TextStyle(
                  color: cDarkGreen,
                  fontSize: setFontSize(55),
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: deviceWidth() * 0.06),
            child: Text(
              nama,
              style: TextStyle(
                  color: cDarkGreen,
                  fontSize: setFontSize(60),
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: deviceWidth() * 0.06, right: deviceWidth() * 0.06, top: 35),
            child: Text(
              "Pilih Jenis Survey",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: setFontSize(50)
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20),
          ),

          CardButton(
            title: "INDEKS DESA MEMBANGUN",
            assetImage: "$imageAssetMenu/idm.png",
            deviceHeight: deviceHeight(),
            deviceWidth: deviceWidth(),
            onTap: (){
              Navigator.pushNamed(context, RouterGenerator.routeProvinsi);
            },
          ),

          Padding(
            padding: EdgeInsets.all(10),
          ),

          CardButton(
            title: "INDEKS PEMBANGUNAN DESA",
            assetImage: "$imageAssetMenu/ipd.png",
            deviceHeight: deviceHeight(),
            deviceWidth: deviceWidth(),
            onTap: (){
              _showToastComingSoon(context);
            },
          ),

          Padding(
            padding: EdgeInsets.all(10),
          ),

          CardButton(
            title: "POTENSI DESA",
            assetImage: "$imageAssetMenu/pd.png",
            deviceHeight: deviceHeight(),
            deviceWidth: deviceWidth(),
            onTap: (){
              _showToastComingSoon(context);
            },
          ),

          Padding(
            padding: EdgeInsets.all(15),
          ),
        ],
      ),
    );
  }
}


