import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/page/cart/cart_page.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productName;

  const ProductDetailsPage({
    Key? key,
    required this.productName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image.asset('assets/images/prod_placeholder.png'),
              Image.network(
                  'https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-product-5_large.png?format=jpg&quality=90&v=1530129458'),
              SizedBox(height: 16),
              Text(
                productName,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black54),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black54),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Add to Cart"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    child: Icon(Icons.star_border),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
