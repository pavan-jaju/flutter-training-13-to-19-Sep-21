import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/page/product_details/product_details_page.dart';

class ProductListItem extends StatelessWidget {
  final String productName;

  const ProductListItem({Key? key, required this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailsPage(productName: productName),
            ),
          );
        },
        title: Text(productName),
        subtitle: Text("Subtitle goes here..."),
        leading: CircleAvatar(
          child: Text(productName[0]),
          backgroundColor: Colors.redAccent,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
