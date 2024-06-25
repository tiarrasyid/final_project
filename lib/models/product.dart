class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
    };
  }

  static Product fromFirestore(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      price: data['price'],
      category: data['category'],
    );
  }
}
