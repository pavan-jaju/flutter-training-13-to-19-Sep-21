import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/page/counter_getx/counter_x_model.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/counter_model.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DisplayerX extends StatelessWidget {
  CounterXModel get counterXModel => Get.find();

  @override
  Widget build(BuildContext context) {
    debugPrint("============== Displayer");
    return Container(
      color: Colors.teal,
      child: Center(
        child: Obx(() {
          debugPrint("============== Displayer Obx");
          return Text("Current value of counter is ${counterXModel.counter}");
        }),
      ),
    );
  }
}

class DisplayerX2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("============== Displayer2");
    return Container(
      color: Colors.orange,
      child: Center(
        child: Obx(() {
          debugPrint("============== Displayer2 Obx");
          return Text(
              "Current value of counter is ${Get.find<CounterXModel>().counter2}");
        }),
      ),
    );
  }
}
