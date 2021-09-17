import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/widget/product_list_item.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hellow World!!")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(4),
                  child: Card(
                    elevation: 4,
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        // color: Colors.teal,
                        child: Center(
                            child: Text("Text $index",
                                style: TextStyle(fontSize: 20)))),
                  ),
                ),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              itemCount: 5,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (_, index) =>
                  ProductListItem(productName: "Product ${index + 1}"),
            ),
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal,
                      child: Center(
                          child: Text("Text $index",
                              style: TextStyle(fontSize: 20)))),
                ),
              ),
            ),
            ListView.builder(
              itemCount: 30,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange,
                    child: Center(
                        child: Text("Text $index",
                            style: TextStyle(fontSize: 20)))),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Press me"))
          ],
        ),
      ),
    );
  }
}
