import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; // = 797
  static double screenWidth = Get.context!.width; // = 411
//Dynamic PageView
  static double pageViewParentContainer320 = screenHeight /
      2.49; // = 2.94 is the screenHeight divided by the height we chosies before (797 / 320 = 2.49)
  static double pageViewContainer220 = screenHeight /
      3.62; // = 2.94 is the screenHeight divided by the height we chosies before (797 / 220 = 3.62)
  static double pageViewTextContainer120 = screenHeight /
      6.64; // = 2.94 is the screenHeight divided by the height we chosies before (797 / 120 = 6.64)
//Dynamic Height Padding And Margin
  static double height45 = screenHeight / 17.71; // (797/45)
  static double height15 = screenHeight / 53.13;
  static double height20 = screenHeight / 39.85;
  static double height1Point2 = screenHeight / 664.16; //(797/1.2)
  static double height10 = screenHeight / 79.7;
  static double height18 = screenHeight / 44.27;
  static double height16 = screenHeight / 49.81;
  static double height30 = screenHeight / 26.56;
  static double height40 = screenHeight / 19.92;
  static double height70 = screenHeight / 11.38;
  static double height80 = screenHeight / 9.96;
  static double height120 = screenHeight / 6.64;

  //Dynamic Height Padding And Margin
  static double width20 = screenHeight /
      39.85; // Using ScreenHeight Not ScreenWidth to be the same value with height
  static double width45 = screenHeight / 17.71;
  static double width10 = screenHeight / 79.7;
  static double width5 = screenWidth / 195.4;
  static double width30 = screenHeight / 26.56;
  static double width15 = screenHeight / 53.13;
  static double width40 = screenHeight / 19.92;

  //Dynamic Fonts
  static double font20 = screenHeight / 39.85;
  static double font12 = screenHeight / 66.41;
  static double font14 = screenHeight / 56.92;
  static double font16 = screenHeight / 49.81;
  static double font24 = screenHeight / 33.20;
  static double font26 = screenHeight / 30.65;

  //Dynamic Radius
  static double radius15 = screenHeight / 53.13;
  static double radius30 = screenHeight / 26.56;
  static double radius20 = screenHeight / 39.85;

  //Dynamic Icon Size
  static double iconSize24 = screenHeight / 33.20;
  static double iconSize20 = screenHeight / 39.85;
  static double iconSize12 = screenHeight / 66.41;
  static double iconSize16 = screenHeight / 49.81;

  // Dynamic ListView Size
  static double ListViewImgSize130 = screenHeight / 6.31;
  static double ListViewTextConSize110 = screenHeight / 7.24;

  // Dynamic Popular Food Detail Page Image Section
  static double popularFoodImgSize350 = screenHeight / 2.26;

  // Dynamic Popular Food Detail Page Bottom Section
  static double bottomHeightBar120 = screenHeight / 6.64;
  static double bottomHeightBar100 = screenHeight / 7.97;

  // Dynamic Recommended Food Detail Page AppBar Section
  static double ImageAppBarHeight300 = screenHeight / 2.65;

  // Dynamic Splash Screen Dimensions
  static double splashImg = screenHeight / 3.81;
}
