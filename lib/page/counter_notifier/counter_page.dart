import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/widget/displayer.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/widget/incrementer.dart';

class CounterNotifierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("============== CounterNotifierPage");
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Notifier Demo"),
      ),
      body: Column(
        children: [
          Expanded(child: Displayer()),
          Expanded(child: Displayer2()),
          Expanded(child: Incrementer()),
        ],
      ),
    );
  }
}
