import 'product.dart';

class CartItem {
  final Product product;
  int quantity;
  int id;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.id = 0,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product'] ?? {}),
      quantity: json['quantity'] != null ? (json['quantity'] as num).toInt() : 1,
      id: json['id'] != null ? (json['id'] as num).toInt() : 0,
    );
  }
}
