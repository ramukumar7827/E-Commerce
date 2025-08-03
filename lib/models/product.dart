import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String category;
  final String image;
  final String description;
  final double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.price,
    required this.quantity,
  });

  // Use when fetching from a Firestore document (like product catalog)
  factory Product.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      name: data['name'],
      category: data['category'],
      image: data['image'],
      description: data['description'],
      price: (data['price'] as num).toDouble(),
      quantity: data['quantity'],
    );
  }

  // Use when decoding from Map (e.g., inside cart array)
  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      id: data['id'] ?? '', // optional fallback
      name: data['name'],
      category: data['category'],
      image: data['image'],
      description: data['description'],
      price: (data['price'] as num).toDouble(),
      quantity: data['quantity'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'description': description,
      'price': price,
      'quantity': quantity,
    };
  }
}

