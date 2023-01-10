import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/data/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/data/controllers/user_controller.dart';
import 'package:food_delivery_app/route/route_helper.dart';
import 'package:get/get.dart';
import 'data/controllers/cart_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    Get.find<UserController>().getUserInfo();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(
        builder: (_) {
          return GetBuilder<CartController>(builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Flutter Demo",
              // home: SignInPage(),
              initialRoute: RouteHelper.getSplashScreen(),
              getPages: RouteHelper.routes,
            );
          });
        },
      );
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

/*
     Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<CartController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      initialRoute: RouteHelper.getSplashScreen(),
      getPages: RouteHelper.routes,
    );
    */