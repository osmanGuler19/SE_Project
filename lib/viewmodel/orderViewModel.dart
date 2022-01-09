// ignore_for_file: file_names

import 'dart:io';

import 'package:provider/provider.dart';
import '../model/order_model.dart';
import '../model/product_model.dart';
import '../model/user_model.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class OrderViewModel extends ChangeNotifier {
  late List<Order> _orderList = [];

  OrderViewModel() {
    _orderList = [];
  }

  Future<void> addOrder(User user, List<Product> orders, double total) async {
    final String response = await rootBundle.loadString('assets/orders.json');
    final data = await json.decode(response)['orders'] as List;

    if (data.isNotEmpty) {
      for (var order in data) {
        _orderList.add(Order.fromJson(order));
      }
    }
    int id = data.length + 1;
    _orderList.add(Order(
        orderDate: DateTime.now(),
        orderId: id.toString(),
        orderStatus: "Pending",
        orderItems: orders,
        orderTotal: total,
        userId: user.email));

    String jsonFile = '{"orders":[';

    for (int i = 0; i < _orderList.length; i++) {
      jsonFile += _orderList[i].toJson().toString();
      jsonFile += ',';
    }
    jsonFile += ']}';

    await File('assets/orders.json').writeAsString(jsonFile);
  }
}
