import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Select category"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) => ListTile(
          onTap: () => Navigator.pop(context, "Category ${index + 1}"),
          title: Text("Category ${index + 1}"),
        ),
      ),
    );
  }
}
