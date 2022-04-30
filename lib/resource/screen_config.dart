import 'package:flutter/material.dart';


// Screen Configuration to scale display with regards to device screen sice
class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

double getProportionateScreenHeight(double inputHeight) {
  var screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight!;
}

double getTextScaleFactor(){
  return SizeConfig.screenWidth! / 375;
}

double getProportionateScreenWidth(double inputWidth) {
  var screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth!;
}