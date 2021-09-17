import 'package:flutter/material.dart';

class ProductListItemVertical extends StatelessWidget {
  final String productName;

  const ProductListItemVertical({Key? key, required this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
          padding: const EdgeInsets.all(8),
          // color: Colors.teal,
          child:
              Center(child: Text(productName, style: TextStyle(fontSize: 20)))),
    );
  }
}
