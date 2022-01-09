import 'product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class Order {
  final String userId;
  final String orderId;
  final DateTime orderDate;
  final double orderTotal;
  final String orderStatus;
  final List<Product> orderItems;

  Order({
    required this.userId,
    required this.orderId,
    required this.orderDate,
    required this.orderTotal,
    required this.orderStatus,
    required this.orderItems,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
