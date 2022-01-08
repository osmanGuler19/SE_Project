// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      price: json['price'],
      quantity: json['quantity'],
      quantityType: json['quantityType'] as String,
      discountRate: json['discountRate'] as int?,
      category: json['category'] as String,
      subCategory: json['subCategory'] as String?,
      brand: json['brand'] as String?,
      color: json['color'] as String?,
      size: json['size'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'price': instance.price,
      'quantity': instance.quantity,
      'quantityType': instance.quantityType,
      'discountRate': instance.discountRate,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'brand': instance.brand,
      'color': instance.color,
      'size': instance.size,
    };
