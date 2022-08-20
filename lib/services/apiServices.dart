import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future getAllPosts() async {
    final allProductUrl = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(allProductUrl);
    //print(response.statusCode);
    //print(response.body);
    return jsonDecode(response.body);
  }

  Future getSinglePost(int id) async {
    final singleProductUrl = Uri.parse("https://fakestoreapi.com/products/$id");
    final response = await http.get(singleProductUrl);
    //print(response.statusCode);
    //print(response.body);
    return jsonDecode(response.body);
  }

  Future getAllCategories() async {
    final AllCategories =
    Uri.parse("https://fakestoreapi.com/products/categories");
    final response = await http.get(AllCategories);
    //print(response.statusCode);
    //print(response.body);
    print(response.body);
    return jsonDecode(response.body);
  }

  Future getProductById(String catName) async {
    final ProductByIdUrl = Uri.parse("https://fakestoreapi.com/products/$catName");
    final response = await http.get(ProductByIdUrl);
    //print(response.statusCode);
    //print(response.body);
    return jsonDecode(response.body);
  }
}