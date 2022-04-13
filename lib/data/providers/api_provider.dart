import 'dart:convert';

import 'package:catalog_app/data/model/product.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<List<Product>?> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    if (response.statusCode == 200) {
      final List products = jsonDecode(response.body);
      return products.map((product) => Product.fromJson(product)).toList();
    }

    return null;
  }
}
