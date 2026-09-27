import 'package:flutter/material.dart';
import 'package:mtongamart/models/category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryApi {
  Future<List<Category>> getCategories() async {
    final response = await http.get(
      Uri.parse('http://172.21.204.184:3000/bule'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load catergories');
    }
    final data = jsonDecode(response.body);
    final categories = (data as List).map((json) => Category.fromJson(json)).toList();
    return categories;
  }
}