import 'package:flutter_taining_app_1/_model/product.dart';
import 'package:flutter_taining_app_1/_repo/product_repo.dart';
import 'package:flutter_taining_app_1/_state/app_state.dart';
import 'package:get/get.dart';

class HomePageX extends GetxController {
  AppState get _appState => Get.find();

  var productFilter = Rx<String?>(null);

  List<Product> get filteredProducts => _appState.products
      .where((p) => p.name
          .toLowerCase()
          .contains(productFilter.value?.toLowerCase() ?? ""))
      .toList();
}
