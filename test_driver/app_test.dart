import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("CounterXApp", () {
    final incrementButtonFinder = find.byValueKey("increment1");
    final counterTextFinder = find.byValueKey("counterxtext");

    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test("on initialized counter should be 0", () async {
      await Future.delayed(Duration(seconds: 10));

      expect(await driver.getText(counterTextFinder),
          "Current value of counter is 0");
    });

    test("on click of increment button, counter should be 1", () async {
      await driver.tap(incrementButtonFinder);

      expect(await driver.getText(counterTextFinder),
          "Current value of counter is 1");
    });

    test("on click of increment button, counter should be 2", () async {
      await driver.tap(incrementButtonFinder);

      expect(await driver.getText(counterTextFinder),
          "Current value of counter is 2");
    });
  });
}
