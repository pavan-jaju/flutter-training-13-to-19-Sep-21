import 'package:flutter_taining_app_1/page/counter_getx/counter_x_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Counter", () {
    test('When counter is initialized then default value of count should be 0',
        () {
      // ARRANGE
      CounterXModel counterXModel = CounterXModel();

      // ACT

      // ASSERT
      expect(counterXModel.counter.value, 0);
    });

    test('When we call increment then count should increment by 1', () {
      // ARRANGE
      CounterXModel counterXModel = CounterXModel();

      // ACT
      counterXModel.increament();

      // ASSERT
      expect(counterXModel.counter.value, 1);
    });
  });
}
