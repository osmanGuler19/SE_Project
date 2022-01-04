import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Product {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final int quantity;
  final int? discountRate;
  final String category;
  final String? subCategory;
  final String? brand;
  final String? color;
  final String? size;

  Product({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.quantity,
    this.discountRate,
    required this.category,
    this.subCategory,
    this.brand,
    this.color,
    this.size,
  });
}
