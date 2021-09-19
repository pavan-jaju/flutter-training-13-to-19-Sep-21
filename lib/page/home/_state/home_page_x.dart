import 'package:flutter_taining_app_1/_model/product.dart';
import 'package:flutter_taining_app_1/_repo/product_db_repo.dart';
import 'package:flutter_taining_app_1/_state/app_state.dart';
import 'package:get/get.dart';

class HomePageX extends GetxController {
  AppState get _appState => Get.find();

  ProductDbRepo get dbRepo => Get.find();

  var productFilter = Rx<String?>(null);

  List<Product> get filteredProducts => products
      .where((p) => p.name
          .toLowerCase()
          .contains(productFilter.value?.toLowerCase() ?? ""))
      .toList();

  RxList<Product> products = <Product>[].obs;

  loadProductsFromDb() async {
    products.value = await dbRepo.listAll();
  }
}
