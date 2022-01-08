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

  ProductViewModel() {
    print('create product view model');
    products = [];
    productcardlist = [];
    categories = ['All'];
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      print('fetch products');
      final String response =
          await rootBundle.loadString('assets/product.json');
      print('bura');
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

  Future<void> getProductCard() async {
    for (int i = 0; i < products.length; i++) {
      Product s = products[i];
      productcardlist.add(ProductCard(
        price: s.price,
        title: s.name,
        description: s.description,
        imagePath: s.imagePath,
        quantity: s.quantity,
      ));
    }
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

    return productsByCategory;
  }
}
