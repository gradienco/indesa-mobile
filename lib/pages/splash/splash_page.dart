import 'dart:async';
import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/router/router_generator.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 1000), (){
      Navigator.pushReplacementNamed(context, RouterGenerator.routeLogin);
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