///Created by Godslove Lee 24.07.2023
///Lasted Edited by Godslove 25.07.2023

import 'dart:math';

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Tacos", "12.98", "lib/assets/tacos.png", Colors.green],
    ["Salad", "2.50", "lib/assets/hanchen_salad.png", Colors.yellow],
    ["Curry", "12.80", "lib/assets/thai_curry.png", Colors.brown],
    ["Hanchen", "1.00", "lib/assets/chicken.png", Colors.blue],
  ];

  // list of cart items
  List _cartItems = [];

  // order ID
  late int _orderId;

  CartModel() {
    // Generate a random order ID when the cart is created.
    _orderId = this.generateRandomId();
  }

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  get orderId => _orderId;

  // add item to cart
  void addItemToCart(int index) {
    ///Fix issue with accessing private variables...(use getters)
    List cartItems = this.cartItems;
    List shopItems = this.shopItems;
    cartItems.add(shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  //if the Cart is empty, a new random Id no will be re-generated
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    if (_cartItems.isEmpty) {
      // Reset the order ID to null if the cart is empty
      _orderId = generateRandomId();
    }
    notifyListeners();
  }

  // generate a random number ID
  int generateRandomId() {
    Random random = Random();
    int randomId = random.nextInt(999999);
    return randomId;
  }
}
