import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/_model/product.dart';
import 'package:flutter_taining_app_1/_state/app_state.dart';
import 'package:flutter_taining_app_1/page/home/_state/home_page_x.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  AppState get _appState => Get.find();

  HomePageX get _pageState => Get.find();

  List<Product> get products => _pageState.filteredProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
            () => Text("Welcome ${_appState.loggedInUser.value?.username} ")),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => _pageState.productFilter.value = value,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search here...",
            ),
          ),
          Expanded(
            child: Obx(() {
              if (products.isEmpty) {
                return Center(child: Text("No products"));
              }

              return ListView.separated(
                itemBuilder: (_, index) => ListTile(
                  title: Text(products[index].name),
                  subtitle: Text("${products[index].rate} \$"),
                  leading: Container(
                    height: 70,
                    width: 70,
                    child: Image.network(
                      products[index].imageUrl,
                      fit: BoxFit.contain,
                      height: 70,
                      width: 70,
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => Divider(),
                itemCount: products.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}
