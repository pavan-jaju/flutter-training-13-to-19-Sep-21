import 'package:flutter_taining_app_1/_model/user.dart';
import 'package:flutter_taining_app_1/_state/app_state.dart';
import 'package:get/get.dart';

class LoginPageX extends GetxController {
  AppState get _appState => Get.find();

  var error = Rx<String?>(null);

  verifyUser({
    required String username,
    required String password,
  }) {
    error.value = null;

    if (username == "user" && password == "pass") {
      _appState.signIn(User(username: username));
    } else {
      error.value = "Please provide valid details";
    }
  }
}
