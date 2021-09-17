import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/counter_model.dart';
import 'package:provider/provider.dart';

class Incrementer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("============== Incrementer");
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<CounterModel>(context, listen: false).increment();
            // context.read<CounterModel>().increment();
          },
          child: Text("I can increment him"),
        ),
      ),
    );
  }
}
