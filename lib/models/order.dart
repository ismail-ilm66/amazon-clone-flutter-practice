import 'dart:convert';

import 'package:amazon_clone/models/product.dart';

class Order {
  final String id;
  final List<Product> products;
  final List<int> quantity;
  final String address;
  final String userId;
  final int orderedAt;
  final int status;

  Order(
      {required this.id,
      required this.products,
      required this.quantity,
      required this.address,
      required this.userId,
      required this.orderedAt,
      required this.status});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'products': products,
      'quantity': quantity,
      'address': address,
      'userId': userId,
      'orderedAt': orderedAt,
      'status': status,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'],
      products: List<Product>.from(
        map['products']?.map(
          (x) => Product.fromMap(
            x['product'],
          ),
        ),
      ),
      quantity: List<int>.from(map['products']?.map((y) => y['quantitiy'])),
      address: map['address'],
      userId: map['userId'],
      orderedAt: map['orderedAt'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
