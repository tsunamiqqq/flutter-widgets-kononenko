import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../utils/app_state.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  final List<Product> products = [
    Product(id: '1', name: 'Навушники', price: 99.99),
    Product(id: '2', name: 'Клавіатура', price: 149.50),
    Product(id: '3', name: 'Миша', price: 59.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Товари'),
        actions: [
          ListenableBuilder(
            listenable: appState,
            builder: (context, child) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Badge(
                    label: Text('${appState.cartItemsCount}'),
                    child: const Icon(Icons.shopping_cart),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: appState,
        builder: (context, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                product: product,
                onFavoriteToggle: () {
                  appState.toggleFavorite(product);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(product.isFavorite ? 'Додано в улюблені' : 'Видалено з улюблених'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                onAddToCart: () {
                  appState.addToCart(product);
                },
              );
            },
          );
        },
      ),
    );
  }
}
