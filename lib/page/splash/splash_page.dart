import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/_state/app_state.dart';
import 'package:flutter_taining_app_1/page/lifecycle_demo/lifecycle_demo_page.dart';
import 'package:flutter_taining_app_1/page/product_list_page_v2/product_list_page_v2.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
//  String title = "Initial value";

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Get.find<AppState>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LifeCycleDemoPage(title: title),
            // ElevatedButton(
            //   child: Text("Go to home page"),
            //   onPressed: () {
            //     setState(() {
            //       title = "NEw val";
            //     });
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => LifeCycleDemoPage(
            //           title: "Initial 3566",
            //         ),
            //       ),
            //     );
            //     // Navigator.pushReplacement(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) => ProductListPageV2(),
            //     //     settings: RouteSettings(name: '/'),
            //     //   ),
            //     // );
            //   },
            // ),
            // ElevatedButton(
            //   child: Text("change title"),
            //   onPressed: () {
            //     setState(() {
            //       title = "NEw val";
            //     });
            //   },
            // ),
            Text(
              "Hey There",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: Colors.purple),
            ),
            SizedBox(height: 32),
            CircularProgressIndicator(
              color: Colors.teal,
            )
          ],
        ),
      ),
    );
  }
}
