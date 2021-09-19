// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/_state/app_state.dart';
import 'package:flutter_taining_app_1/main.dart';
import 'package:flutter_taining_app_1/page/counter_getx/counter_x_model.dart';
import 'package:flutter_taining_app_1/page/counter_getx/counter_x_page.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/counter_model.dart';
import 'package:flutter_taining_app_1/page/counter_notifier/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('CounterXPage increments smoke test',
      (WidgetTester tester) async {
    // ARRANGE
    Get.put(CounterXModel());
    Get.put(AppState());

    await tester.pumpWidget(
      GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        home: CounterXPage(),
      ),
    );

    expect(find.text("Current value of counter is 0"), findsOneWidget);

    // ACT
    await tester.tap(find.byKey(ValueKey("increment1")));
    await tester.pump();

    // ASSERT
    expect(find.text("Current value of counter is 1"), findsOneWidget);
  });

  testWidgets('CounterNotifierPage increments smoke test',
      (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => CounterModel(),
        child: GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          debugShowCheckedModeBanner: false,
          home: CounterNotifierPage(),
        ),
      ),
    );

    expect(find.text("Current value of counter is 0"), findsOneWidget);

    // ACT
    await tester.tap(find.byKey(ValueKey("increment_notifier_1")));
    await tester.pump();

    // ASSERT
    expect(find.text("Current value of counter is 1"), findsOneWidget);
  });
}
