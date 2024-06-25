import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_marketplace/models/product.dart';

class ProductService {
  final CollectionReference productCollection = FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(Product product) async {
    return await productCollection.doc(product.id).set(product.toMap());
  }

  Future<void> updateProduct(Product product) async {
    return await productCollection.doc(product.id).update(product.toMap());
  }

  Future<void> deleteProduct(String id) async {
    return await productCollection.doc(id).delete();
  }

  Stream<List<Product>> getProducts() {
    return productCollection.snapshots().map(_productListFromSnapshot);
  }

  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Product.fromFirestore(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
