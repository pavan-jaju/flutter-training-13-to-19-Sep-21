import 'package:get/get.dart';

class CounterXModel extends GetxController {
  var counter = 0.obs;
  var counter2 = 0.obs;

  increament() {
    counter++;
  }

  increament2() {
    counter2++;
  }
}
