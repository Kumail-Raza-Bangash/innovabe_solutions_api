import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

// // Dimensions in physical pixels (px)
// Size size = view.physicalSize;
// double width = size.width;
// double height = size.height;

// Dimensions in logical pixels (dp)
Size size = view.physicalSize / view.devicePixelRatio;
double width = size.width;
double height = size.height;

class Dimensions {
  static double screenHeight = height; //My OPPO f17 height is 925
  static double screenWidth = width; //My OPPO f17 width is 421 OPPO f17 width is 421


  //dynamic height for passing and margin
  static double height10 = screenHeight / 92.5; // 925/10
  static double height15 = screenHeight / 61.66; // 925/15
  static double height20 = screenHeight / 46.25; // 925/20
  static double height30 = screenHeight / 30.83; // 925/30
  static double height45 = screenHeight / 20.55; // 925/45

  //dynamic width for passing and margin
  static double width10 = screenHeight / 92.5; // 925/10
  static double width15 = screenHeight / 61.66; // 925/15
  static double width20 = screenHeight / 46.25; // 925/20
  static double width30 = screenHeight / 30.83; // 925/30
  static double width45 = screenHeight / 20.55; // 925/45

  // font size
  static double font16 = screenHeight / 57.81; // 925/16
  static double font20 = screenHeight / 46.25; // 925/20
  static double font26 = screenHeight / 35.57; // 925/26

  static double radius15 = screenHeight / 61.66; // 925/15
  static double radius20 = screenHeight / 46.25; // 925/20
  static double radius30 = screenHeight / 30.83; // 925/30

  //icons Sizes
  static double iconSize24 = screenHeight / 38.54; // 925/24
  static double iconSize16 = screenHeight / 57.81; // 925/16
}
