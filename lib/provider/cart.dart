import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CartItem {
  final String id;
  final String title;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartList = {};

  Map<String, CartItem> get cartList {
    return {..._cartList};
  }

  void addItem(
    String prodId,
    String title,
    double price,
    String description,
    String imageUrl,
  ) {
    if (_cartList.containsKey(prodId)) {
      _cartList.update(
          prodId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              description: existingCartItem.description,
              price: existingCartItem.price,
              imageUrl: existingCartItem.imageUrl,
              quantity: existingCartItem.quantity + 1));
      notifyListeners();
      log(cartList.length.toString());
    } else {
      _cartList.putIfAbsent(
          prodId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              description: description,
              price: price,
              imageUrl: imageUrl,
              quantity: 1));
      notifyListeners();
      log(cartList.length.toString());
    }
  }

  void decrement(
    String prodId,
    String title,
    double price,
    String description,
    String imageUrl,
  ) {
    _cartList.update(
        prodId,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            description: existingCartItem.description,
            price: existingCartItem.price,
            imageUrl: existingCartItem.imageUrl,
            quantity: existingCartItem.quantity - 1));
    notifyListeners();
  }

  int coffeeQuantity(String prodId) {
    if (_cartList.isNotEmpty) {
      int quantity = _cartList.values
          .toList()
          .firstWhere((element) => element.id == prodId)
          .quantity;
      return quantity;
    } else {
      return 0;
    }
  }

  double get totalAmount {
    double total = 0;
    _cartList.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  double get toPay {
    double total = 0;
    _cartList.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return (total + 15);
  }

  void removeItem(String prodId) {
    _cartList.remove(prodId);
    notifyListeners();
  }

  void clearCart() {
    _cartList.clear();
    notifyListeners();
  }

  int getQuantity(String id) {
    return _cartList.values
        .toList()
        .firstWhere((element) => element.id == id)
        .quantity;
  }
}
