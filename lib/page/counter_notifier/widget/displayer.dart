import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/counter_model.dart';
import 'package:provider/provider.dart';

class Displayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("============== Displayer");
    return Container(
      color: Colors.teal,
      child: Center(
        child: Text(
            "Current value of counter is ${context.watch<CounterModel>().counter}"),
      ),
    );
  }
}

class Displayer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("============== Displayer2");
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text(
            "Current value of counter is ${context.watch<CounterModel>().counter2}"),
      ),
    );
  }
}
