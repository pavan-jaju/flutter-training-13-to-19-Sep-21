import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_taining_app_1/main.dart' as app;

// flutter driver --target=test_driver/app.dart

void main() {
  enableFlutterDriverExtension();

  app.main();
}
