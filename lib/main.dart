import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/router/router_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      accentColor: cDarkGreen,
      primaryColor: cDarkGreen,
      fontFamily: 'Proxima',
      scaffoldBackgroundColor: Colors.white,
    ),
      initialRoute: RouterGenerator.routeSplash,
      onGenerateRoute: RouterGenerator.generate,
    );
  }
}
