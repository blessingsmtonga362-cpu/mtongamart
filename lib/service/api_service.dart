
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mtongamart/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> getProducts() async{
    final response = await http.get(
      Uri.parse('http://10.135.74.184:3000/products'),
    );
    if(response.statusCode != 200){
      throw Exception("Failed to load products but it connected to the server");
    }
    final data=jsonDecode(response.body);
    final products = (data as List).map((json) => Product.fromJson(json)).toList();
    return products;
  }

  Future<Product> createNote(String title) async{
    final response = await http.post(
      Uri.parse('http://192.168.1.219:3000/products'),

      headers:{'Content-Type':'application/json'},
      body:jsonEncode({'title':title}),
    );
    if(response.statusCode != 201&& response.statusCode != 200){
      throw Exception("Failed to create note");
    }

    final data=jsonDecode(response.body);
    return Product.fromJson(data);
  }

}