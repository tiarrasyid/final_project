import 'package:flutter/material.dart';
import 'package:my_marketplace/services/product_service.dart';
import 'package:my_marketplace/models/product.dart';
import 'package:my_marketplace/widgets/custom_text_field.dart';
import 'package:my_marketplace/widgets/custom_button.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;

  EditProductScreen({required this.product});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productService = ProductService();
  late String _name;
  late String _description;
  late String _price;
  late String _category;

  @override
  void initState() {
    super.initState();
    _name = widget.product.name;
    _description = widget.product.description;
    _price = widget.product.price.toString();
    _category = widget.product.category;
  }

  void _updateProduct() async {
    if (_formKey.currentState!.validate()) {
      Product updatedProduct = Product(
        id: widget.product.id,
        name: _name,
        description: _description,
        price: double.parse(_price),
        category: _category,
      );
      await _productService.updateProduct(updatedProduct);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CustomTextField(
                hintText: 'Name',
                initialValue: _name,
                onChanged: (value) => _name = value,
              ),
              CustomTextField(
                hintText: 'Description',
                initialValue: _description,
                onChanged: (value) => _description = value,
              ),
              CustomTextField(
                hintText: 'Price',
                initialValue: _price,
                onChanged: (value) => _price = value,
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                hintText: 'Category',
                initialValue: _category,
                onChanged: (value) => _category = value,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Update Product',
                onPressed: _updateProduct,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
