import 'package:flutter/cupertino.dart';

class Coffee with ChangeNotifier {
  final String id;
  final String coffeeName;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final String totalRating;
  final String briefDescription;
  bool isFavourite;
  int quantity;

  Coffee({
    required this.quantity,
    required this.briefDescription,
    required this.totalRating,
    required this.rating,
    required this.id,
    required this.coffeeName,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.isFavourite,
  });
}
