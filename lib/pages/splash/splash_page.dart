import 'dart:async';
import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  DatabaseHelper _dbHelper = DatabaseHelper();

  void _checkToken() async{
    try {
      var r = await _dbHelper.checkToken();
      if(r.isNotEmpty)
        Navigator.pushReplacementNamed(context, RouterGenerator.routeDashboard);
    } catch (error) {
      Navigator.pushReplacementNamed(context, RouterGenerator.routeLogin);
    }
  }

  @override
  void initState() {
    Timer(Duration(milliseconds: 1000), (){
      _checkToken();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setupScreenUtil(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              child: Positioned(
                top: (deviceHeight()*0.5) - 90,
                left: (deviceWidth()*0.5) - 90,
                child: Image(
                  width: 180,
                  height: 180,
                  image: AssetImage("$imageAsset/logo_indesa.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}