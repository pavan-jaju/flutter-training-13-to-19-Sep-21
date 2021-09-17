import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/page/counter_getx/counter_x_model.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/counter_model.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class IncrementerX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("============== Incrementer");
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.find<CounterXModel>().increament();
            },
            child: Text("I can increment counter 1"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<CounterXModel>().increament2();
            },
            child: Text("I can increment counter 2"),
          ),
        ],
      ),
    );
  }
}
