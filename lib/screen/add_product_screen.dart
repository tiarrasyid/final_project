import 'package:flutter/material.dart';
import 'package:my_marketplace/services/product_service.dart';
import 'package:my_marketplace/models/product.dart';
import 'package:my_marketplace/widgets/custom_text_field.dart';
import 'package:my_marketplace/widgets/custom_button.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productService = ProductService();
  String _name = '';
  String _description = '';
  String _price = '';
  String _category = '';

  void _addProduct() async {
    if (_formKey.currentState!.validate()) {
      Product product = Product(
        id: DateTime.now().toString(),
        name: _name,
        description: _description,
        price: double.parse(_price),
        category: _category,
      );
      await _productService.addProduct(product);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CustomTextField(
                hintText: 'Name',
                onChanged: (value) => _name = value,
              ),
              CustomTextField(
                hintText: 'Description',
                onChanged: (value) => _description = value,
              ),
              CustomTextField(
                hintText: 'Price',
                onChanged: (value) => _price = value,
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                hintText: 'Category',
                onChanged: (value) => _category = value,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Add Product',
                onPressed: _addProduct,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
