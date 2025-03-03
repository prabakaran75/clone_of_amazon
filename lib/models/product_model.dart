// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clone_of_amazon/models/rating_model.dart';

class ProductModel {
  final String name;
  final String desc;
  final int qty;
  final double price;
  final String category;
  final List<String> images;
  final String? id;
  final List<RatingModel>? rating;
  ProductModel({
    required this.name,
    required this.desc,
    required this.qty,
    required this.price,
    required this.category,
    required this.images,
    this.id,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'desc': desc,
      'qty': qty,
      'price': price,
      'category': category,
      'images': images,
      'id': id,
      'rating': rating,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      qty: map['qty'] ?? 0,
      price: map['price'].toDouble() ?? 0.0,
      category: map['category'] ?? '',
      images: List<String>.from(map['images']),
      id: map['_id'],
      rating: map['ratings'] != null
          ? List<RatingModel>.from(
              map['ratings']?.map(
                (e) => RatingModel.fromMap(e),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
