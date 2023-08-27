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
  final double totalPrice;

  Order(
      {required this.id,
      required this.totalPrice,
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
      'totalPrice': totalPrice
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    List<int> x = [];
    for (int i = 0; i < map['products'].length; i++) {
      x.add(map['products'][i]['quantity']);
    }
    print(x);
    return Order(
      id: map['_id'],
      products: List<Product>.from(
        map['products']?.map(
          (x) => Product.fromMap(
            x['product'],
          ),
        ),
      ),

      //quantity: List<int>.from(map['products']?.map((y) => y['quantitiy'])),
      quantity: x,
      address: map['address'],
      userId: map['userId'],
      orderedAt: map['orderedAt'],
      status: map['staus'],
      totalPrice: double.parse(map['totalPrice'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
