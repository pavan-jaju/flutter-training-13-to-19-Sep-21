import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/_common/preference_utils.dart';
import 'package:flutter_taining_app_1/_model/product.dart';
import 'package:flutter_taining_app_1/_model/user.dart';
import 'package:flutter_taining_app_1/_repo/product_repo.dart';
import 'package:flutter_taining_app_1/page/home/_state/home_page_x.dart';
import 'package:get/get.dart';

class AppState extends GetxController {
  ProductRepo get _productRepo => Get.find();

  HomePageX get homePageState => Get.find();

  var state = APP_STATE_ENUM.UNKNOWN.obs;

  var loggedInUser = Rx<User?>(null);

  var products = <Product>[].obs;

  init() async {
    products.value = await _productRepo.fetchProducts();

    await homePageState.loadProductsFromDb();

    loggedInUser.value = await PreferenceUtils.getSignedInState();
    if (loggedInUser.value != null) {
      state.value = APP_STATE_ENUM.AUTHENTICATED;
    } else {
      state.value = APP_STATE_ENUM.UNAUTHENTICATED;
    }
  }

  signIn(User user) async {
    loggedInUser.value = user;
    await PreferenceUtils.saveSignInState(user);
    state.value = APP_STATE_ENUM.AUTHENTICATED;
  }

  signOut() async {
    loggedInUser.value = null;
    await PreferenceUtils.saveSignInState(null);
    state.value = APP_STATE_ENUM.UNAUTHENTICATED;
  }
}

enum APP_STATE_ENUM { UNKNOWN, AUTHENTICATED, UNAUTHENTICATED }
