import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cart.dart';

class CartService {
  final String baseurl = 'http://192.168.1.219:3000';
  final int defaultUserId = 6; // Fixed user ID 6 for now

  Future<Cart> getCart() async {
    final response = await http.get(Uri.parse('$baseurl/cart/$defaultUserId'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Cart.fromJson(data);
    }
    throw Exception('Failed to load cart (Status: ${response.statusCode})');
  }

  Future<void> addToCart(int productId, {int quantity = 1}) async {
    final response = await http.post(
      Uri.parse('$baseurl/cart/$defaultUserId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'productId': productId, 'quantity': quantity}),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to add item to cart (Status: ${response.statusCode})');
    }
  }

  Future<void> changeQuantity(int cartItemId, int delta) async {
    final response = await http.patch(
      Uri.parse('$baseurl/cart/$defaultUserId/items/$cartItemId/quantity'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'delta': delta}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update cart quantity (Status: ${response.statusCode})');
    }
  }

  Future<void> removeItem(int cartItemId) async {
    final response = await http.delete(
      Uri.parse('$baseurl/cart/$defaultUserId/items/$cartItemId'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to remove cart item (Status: ${response.statusCode})');
    }
  }
}
