import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// --------------
/// Constant Color
/// --------------
const cDarkGreen = Color(0xFF2A6049);
const cLightGrey = Color(0xFFF7F8FA);
const cBlue = Color(0xFF005AA0);

/// --------------
/// Asset Location
/// --------------
/// Example: $iconAsset/logo.svg
String iconAsset = "assets/icons";
String imageAsset = "assets/images";
String imageAssetProfile = "$imageAsset/profile";
String imageAssetCategory = "$imageAsset/category";
String imageAssetMenu = "$imageAsset/menu";


/// -----------------------------------
/// Font and size scaling screen utils
/// -----------------------------------
/// Initialize screen util
void setupScreenUtil(BuildContext context)
=> ScreenUtil.init(context, allowFontScaling: true);

/// ------------
/// Device Size
/// ------------
double deviceWidth() => ScreenUtil.screenWidth;
double deviceHeight() => ScreenUtil.screenHeight;

/// Setting fontsize
double setFontSize(double size)  => ScreenUtil().setSp(size, allowFontScalingSelf: true);

/// -----------------------------------
/// Constant Base Text Styling
/// -----------------------------------
TextStyle answerTextStyle = TextStyle(
  fontSize: setFontSize(14),
  color: Colors.black,
);

TextStyle mainTextStyle = TextStyle(
  fontSize: setFontSize(80),
  color: Colors.black,
);



