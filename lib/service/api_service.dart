
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mtongamart/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
   Future<List<Product>> getProducts() async{
    final response = await http.get(
      Uri.parse('http://172.21.204.184:3000/products'),
    );
    if(response.statusCode != 200){
      throw Exception("Failed to load products but it connected to the server");
    }
    final data=jsonDecode(response.body);
    final products = (data as List).map((json) => Product.fromJson(json)).toList();
    return products;
  }






}