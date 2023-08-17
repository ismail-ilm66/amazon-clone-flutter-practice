import 'dart:convert';

class Product {
  final String name;
  final String description;
  final double price;
  final double quantitiy;
  final String category;
  final List<dynamic> imagesUrl;
  final String? id;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantitiy,
    required this.category,
    required this.imagesUrl,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantitiy,
      'category': category,
      'imagesUrl': imagesUrl,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      description: map['description'],
      price: double.parse(map['price'].toString()),
      quantitiy: double.parse(map['quantity'].toString()),
      category: map['category'],
      imagesUrl: map['imagesUrl'],
      id: map['_id'],
    );
  }
  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
