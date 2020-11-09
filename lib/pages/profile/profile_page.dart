import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/widgets/widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 15),
            child: CircleImage(
              width: 110,
              image: AssetImage("$imageAssetProfile/profile.jpg"),
            ),
          ),

          Center(
            child: Text(
              "Alun Paranggi Wicaksono",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: cDarkGreen
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Label(
              totalSurvey: "10",
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
              subtitle: "alunparanggi",
              onTap: (){}
          ),

          ListTileProfile(
              icon: "email",
              title: "Email",
              subtitle: "alunparanggi@gmail.com",
              onTap: (){}
          ),

          ListTileProfile(
              icon: "phone",
              title: "No. Hp",
              subtitle: "085156220370",
              onTap: (){}
          ),

          ListTileProfile(
              icon: "nik",
              title: "NIK",
              subtitle: "1810043103990002",
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
            onTap: (){},
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
