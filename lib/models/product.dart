

import 'package:flutter/foundation.dart';

class Product{
   final String image;
   final String name;
   final double price;
   final double rating;
   final int  reviews;

   Product({
     required this.image,
     required this.name,
     required this.price,
     required this.rating,
     required this.reviews
});

   factory Product.fromJson(Map<String, dynamic> json) {
     return Product(
       image: json['image'] ?? '',
       name: json['name'] ?? 'No Name',
       price: json['price'] != null ? (json['price'] as num).toDouble() : 0.0,
       rating: json['rating'] != null ? (json['rating'] as num).toDouble() : 0.0,
       reviews: json['reviews'] != null ? (json['reviews'] as num).toInt() : 0,
     );
   }

}