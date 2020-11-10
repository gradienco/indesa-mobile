import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/widgets/widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setupScreenUtil(context);
    return Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        Padding(
          padding: EdgeInsets.only(top: 56, bottom: 15),
          child: CircleImage(
            width: 120,
            image: AssetImage("$imageAssetProfile/profile.jpg"),
          ),
        ),

        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Alun Paranggi Wicaksono",
              style: TextStyle(
                color: cDarkGreen,
                fontSize: setFontSize(60),
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),

        Label(
          totalSurvey: "10",
        ),

        Container(
          margin: EdgeInsets.only(left: deviceWidth() * 0.06, right: deviceWidth() * 0.06, top: 30),
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
          onTap: (){},
        ),

        Padding(
          padding: EdgeInsets.all(10),
        ),

        CardButton(
          title: "POTENSI DESA",
          assetImage: "$imageAssetMenu/pd.png",
          deviceHeight: deviceHeight(),
          deviceWidth: deviceWidth(),
          onTap: (){},
        ),

        Padding(
          padding: EdgeInsets.all(15),
        ),
      ],
    );
  }
}

