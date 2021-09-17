import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/_common/constants.dart';
import 'package:flutter_taining_app_1/_model/product.dart';
import 'package:flutter_taining_app_1/_repo/product_db_repo.dart';
import 'package:get/get.dart' as getx;

class ProductRepo {
  ProductDbRepo get dbRepo => getx.Get.find();

  Dio? _dio;

  Dio get client {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
        baseUrl: BASE_URL,
        headers: {
          "X-Parse-Application-Id": APP_ID,
          "X-Parse-REST-API-Key": API_KEY
        },
      ));
    }

    return _dio!;
  }

  Future<List<Product>> fetchProducts() async {
    try {
      Response response = await client.get('classes/Product');

      if (response.statusCode == 200) {
        var productsMap = response.data["results"] as List;

        var products =
            productsMap.map<Product>((e) => Product.fromMap(e)).toList();

        products.forEach((product) async {
          await dbRepo.add(product);
        });

        return products;
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }
}
