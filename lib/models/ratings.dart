import 'dart:convert';

class Ratings {
  final String userId;
  final double rating;

  Ratings({required this.userId, required this.rating});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'rating': rating,
    };
  }

  factory Ratings.fromMap(Map<String, dynamic> map) {
    return Ratings(
      userId: map['userId'],
      rating: double.parse(map['rating'].toString()),
    );
  }
  String toJson() => json.encode(toMap());

  factory Ratings.fromJson(String source) =>
      Ratings.fromMap(json.decode(source));
}
