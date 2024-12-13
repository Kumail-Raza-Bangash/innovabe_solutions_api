import 'package:flutter/widgets.dart';

class Dimensions {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

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
