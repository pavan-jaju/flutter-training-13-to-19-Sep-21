import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/page/counter_getx/counter_x_model.dart';
import 'package:flutter_taining_app_1/page/counter_getx/widget/displayer_x.dart';
import 'package:flutter_taining_app_1/page/counter_getx/widget/incrementer_x.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/widget/displayer.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/widget/incrementer.dart';
import 'package:get/get.dart';

class CounterXPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CounterXModel());

    debugPrint("============== CounterNotifierPage");
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Demo"),
      ),
      body: Column(
        children: [
          Expanded(child: DisplayerX()),
          Expanded(child: DisplayerX2()),
          Expanded(child: IncrementerX()),
        ],
      ),
    );
  }
}
