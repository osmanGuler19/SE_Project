// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:gotur/widgets/product_card.dart';
import 'package:provider/provider.dart';
import '../model/product_model.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class ProductViewModel extends ChangeNotifier {
  late List<Product> products;
  late List<ProductCard> productcardlist;
  late List<String> categories;
  late List<Product> shoppingcard;
  int totalAmount = 0;

  ProductViewModel() {
    print('create product view model');
    products = [];
    productcardlist = [];
    categories = ['All'];
    shoppingcard = [];
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final String response =
          await rootBundle.loadString('assets/product.json');
      final data = await json.decode(response)['products'] as List;
      for (int i = 0; i < data.length; i++) {
        Product dummy = Product.fromJson(data[i]);
        products.add(dummy);
        if (!categories.contains(dummy.category)) {
          categories.add(dummy.category);
        }
      }
      print(data);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> getCategories() async {
    for (int i = 0; i < products.length; i++) {
      Product s = products[i];
    }
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    List<Product> productsByCategory = [];
    if (category.toLowerCase() == 'all') {
      productsByCategory = products;
    } else {
      for (int i = 0; i < products.length; i++) {
        Product s = products[i];
        if (s.category == category) {
          productsByCategory.add(s);
        }
      }
    }
    notifyListeners();
    return productsByCategory;
  }

  void addToShoppingCard(Product product) {
    shoppingcard.add(product);
    totalAmount += product.price.toInt();
    notifyListeners();
  }

  void deleteFromShoppingCard(Product product) {
    shoppingcard.remove(product);
    totalAmount -= product.price.toInt();
    notifyListeners();
  }
}
