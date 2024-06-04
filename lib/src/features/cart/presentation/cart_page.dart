import 'package:app_commerce/src/data/database_repository.dart';

import 'package:app_commerce/src/features/overview/domain/product.dart';

import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final DatabaseRepository repo;

  CartPage({required this.repo, super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.repo.removeFromCart(product);
                Navigator.pop(context);
              });
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  late List<Product> cart;
  @override
  void initState() {
    cart = widget.repo.cart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          // Cart list
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
