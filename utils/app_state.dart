import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/user.dart';

class AppState extends ChangeNotifier {
  final List<Product> _favoriteProducts = [];
  User? _currentUser;
  int _cartItemsCount = 0;

  List<Product> get favoriteProducts => _favoriteProducts;
  User? get currentUser => _currentUser;
  int get cartItemsCount => _cartItemsCount;

  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    if (product.isFavorite) {
      _favoriteProducts.add(product);
    } else {
      _favoriteProducts.removeWhere((p) => p.id == product.id);
    }
    notifyListeners();
  }

  void addToCart(Product product) {
    _cartItemsCount++;
    notifyListeners();
  }
}

final appState = AppState();
