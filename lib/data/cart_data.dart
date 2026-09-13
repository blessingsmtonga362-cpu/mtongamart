import 'package:flutter/material.dart';
import 'package:mtongamart/models/cartItem.dart';
import 'package:mtongamart/models/product.dart';

class CartData extends ChangeNotifier{
  final List<CartItem> items=[];

  void addProduct(
      Product product
      ){
    final existingItem = items.where(
          (item) => item.product == product,
    );
if(existingItem.isNotEmpty){
  existingItem.first.quantity +=1;
}else{
    items.add(
    CartItem(product: product)
    );}
    notifyListeners();
  }

}

final CartData cart=CartData();