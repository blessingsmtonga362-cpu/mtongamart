import 'package:flutter/material.dart';
class Category {
  final String image;
  final String name;
  final String slug;

  Category({
    required this.image,
    required this.name,
    required this.slug
});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      image: json['image'] ?? '',
      name: json['name'] ?? 'No Name',
      slug: json['slug'] ?? '',
    );
  }
}

