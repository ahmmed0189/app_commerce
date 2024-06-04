import 'package:flutter/material.dart';

class ProductTyp extends StatelessWidget {
  final String productTyp;
  final bool isSelected;
  final VoidCallback onTap;

  const ProductTyp({
    super.key,
    required this.productTyp,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          productTyp,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.amber : Colors.white,
          ),
        ),
      ),
    );
  }
}
