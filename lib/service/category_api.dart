import 'package:flutter/material.dart';
import 'package:mtongamart/models/category.dart';
import 'package:mtongamart/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryApi {
  Future<List<Category>> getCategories() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.219:3000/bule'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load catergories');
    }
    final data = jsonDecode(response.body);
    final categories = (data as List).map((json) => Category.fromJson(json)).toList();
    return categories;
  }

  Future<List<Product>> getProductsByCategory(int categoryId) async {
    final response = await http.get(
      Uri.parse('http://192.168.1.219:3000/products/single/$categoryId'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load products');
    }
    final data = jsonDecode(response.body);
    final products = (data as List).map((json) => Product.fromJson(json)).toList();
    return products;
  }
}