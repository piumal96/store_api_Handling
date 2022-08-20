import 'package:flutter/material.dart';

class CategoryProductPage extends StatelessWidget {
  final String categoryName;

  CategoryProductPage(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
