import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:indesa_beta/widgets/widget.dart';
import 'package:sqflite/sqflite.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  DatabaseHelper _dbHelper = DatabaseHelper();
  String _nama ="", _username="", _email="", _noHp="", _nik="";

  void _getUserData(){
    final Future<Database> dbFuture = _dbHelper.initializeDatabase();
    dbFuture.then((database){
      Future<Map<String, dynamic>> userData = _dbHelper.getUser();
      userData.then((data){
        setState(() {
          _nama = data['nama_lengkap'];
          _username = data['username'];
          _email = data['email'];
          _noHp = data['no_hp'];
          _nik = data['nik'];
        });
      });
    });
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
            padding: EdgeInsets.only(top: 56, bottom: 20),
            child: Center(
              child: Text(
                _nama,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: setFontSize(65),
                    color: cDarkGreen
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: Colors.black.withOpacity(0.3),
              thickness: 1,
            ),
          ),

          ListTileProfile(
              icon: "user",
              title: "Username",
              subtitle: _username,
              onTap: (){}
          ),

          ListTileProfile(
              icon: "email",
              title: "Email",
              subtitle: _email,
              onTap: (){}
          ),

          ListTileProfile(
              icon: "phone",
              title: "No. Hp",
              subtitle: _noHp,
              onTap: (){}
          ),

          ListTileProfile(
              icon: "nik",
              title: "NIK",
              subtitle: _nik,
              onTap: (){}
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: Colors.black.withOpacity(0.3),
              thickness: 1,
            ),
          ),

          ListTile(
            onTap: () async{
              var result = await _dbHelper.deleteUserData();
              if(result != 0){
                showToast("Logout berhasil", context);
                Navigator.pushNamedAndRemoveUntil(context, RouterGenerator.routeLogin, (route) => false);
              } else {
                showToast("Logout gagal", context);
              }
            },
            leading: Image(
              image: AssetImage("$imageAssetProfile/logout.png"),
              width: 35,
              height: 35,
            ),
            title: Text("Keluar",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: setFontSize(50)
              ),),
          ),

          Padding(
            padding: EdgeInsets.all(10),
          )

        ],
      ),
    );
  }
}

