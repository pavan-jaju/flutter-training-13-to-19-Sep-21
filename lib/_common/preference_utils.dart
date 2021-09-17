import 'dart:convert';

import 'package:flutter_taining_app_1/_model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static const _SIGNED_IN_USER = "SIGNED_IN_USER";

  static Future saveSignInState(User? user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (user == null)
      await prefs.remove(_SIGNED_IN_USER);
    else
      await prefs.setString(_SIGNED_IN_USER, jsonEncode(user.toMap()));
  }

  static Future<User?> getSignedInState() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var jsonStr = prefs.getString(_SIGNED_IN_USER);
      if (jsonStr == null) return null;
      return User.fromMap(jsonDecode(jsonStr));
    } catch (e) {
      return null;
    }
  }
}
