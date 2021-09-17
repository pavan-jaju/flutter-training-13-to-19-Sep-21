import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/_repo/product_db_repo.dart';
import 'package:flutter_taining_app_1/_repo/product_repo.dart';
import 'package:flutter_taining_app_1/page/counter_getx/counter_x_model.dart';
import 'package:flutter_taining_app_1/page/counter_getx/counter_x_page.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/counter_model.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/counter_page.dart';
import 'package:flutter_taining_app_1/page/home/_state/home_page_x.dart';
import 'package:flutter_taining_app_1/page/home/home_page.dart';
import 'package:flutter_taining_app_1/page/lifecycle_demo/lifecycle_demo_page.dart';
import 'package:flutter_taining_app_1/page/login/login_page.dart';
import 'package:flutter_taining_app_1/page/product_list_page_v2/product_list_page_v2.dart';
import 'package:flutter_taining_app_1/page/qr_scanner/qr_scanner_page.dart';
import 'package:flutter_taining_app_1/page/splash/splash_page.dart';
import 'package:flutter_taining_app_1/_state/app_state.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// void main() => runApp(
//     ChangeNotifierProvider(create: (_) => CounterModel(), child: MyApp()));

void main() {
  Get.put(AppState());
  Get.put(ProductDbRepo());
  Get.put(ProductRepo());
  Get.put(HomePageX());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: Obx(() {
        var state = Get.find<AppState>().state;

        if (state.value == APP_STATE_ENUM.AUTHENTICATED) return HomePage();

        if (state.value == APP_STATE_ENUM.UNAUTHENTICATED) return LoginPage();

        return SplashPage();
      }),
      // initialRoute: "/",
    );
  }
}
