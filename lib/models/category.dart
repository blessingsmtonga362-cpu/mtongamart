import 'package:flutter/material.dart';
class Category {
  final String image;
  final String name;
  final int id;

  Category({
    required this.image,
    required this.name,
    required this.id
});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      image: json['image'] ?? '',
      name: json['name'] ?? 'No Name',
      id: json['id'] ,
    );
  }
}

