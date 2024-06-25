import 'package:flutter/material.dart';
import 'package:my_marketplace/screens/edit_product_screen.dart';
import 'package:my_marketplace/models/product.dart';
import 'package:my_marketplace/services/product_service.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  void _deleteProduct(BuildContext context) async {
    final ProductService _productService = ProductService();
    await _productService.deleteProduct(product.id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: ${product.name}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Description: ${product.description}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Price: ${product.price}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Category: ${product.category}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProductScreen(product: product)),
                    );
                  },
                  child: Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: () => _deleteProduct(context),
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
