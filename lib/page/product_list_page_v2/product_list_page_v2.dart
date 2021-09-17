import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/page/cart/cart_page.dart';
import 'package:flutter_taining_app_1/page/category_selector/category_selector_page.dart';
import 'package:flutter_taining_app_1/_state/app_state.dart';
import 'package:flutter_taining_app_1/widget/product_list_item.dart';
import 'package:flutter_taining_app_1/widget/product_list_item_verticle.dart';
import 'package:get/get.dart';

class ProductListPageV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hellow World!!"),
        actions: [
          IconButton(
            onPressed: () {
              // Get.to(CartPage());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              Get.find<AppState>().signOut();
            },
            icon: Icon(Icons.verified_user),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: ProductListItemVertical(
                  productName: "Prod ${index + 1}",
                ),
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (_, index) =>
                  ProductListItem(productName: 'Product ${index + 1}'),
            ),
          ),
          InkWell(
            onTap: () async {
              print("================= onTap called");
              var data = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategorySelector(),
                ),
              );
              if (data != null && data is String) {
                print("=================== selected category is $data");
              } else {
                print("=================== nothing is selected ");
              }
              print("================= onTap continued");
            },
            child: Container(
              height: 40,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Select Category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              color: Colors.yellow,
            ),
          ),
          // ElevatedButton(onPressed: () {}, child: Text("Press me"))
        ],
      ),
    );
  }
}
