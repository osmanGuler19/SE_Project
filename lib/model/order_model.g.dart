// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      userId: json['userId'] as String,
      orderId: json['orderId'] as String,
      orderDate: DateTime.parse(json['orderDate'] as String),
      orderTotal: (json['orderTotal'] as num).toDouble(),
      orderStatus: json['orderStatus'] as String,
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'userId': instance.userId,
      'orderId': instance.orderId,
      'orderDate': instance.orderDate.toIso8601String(),
      'orderTotal': instance.orderTotal,
      'orderStatus': instance.orderStatus,
      'orderItems': instance.orderItems,
    };
