import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  const ProductCard(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.description})
      : super(key: key);

  //Buraya generic bir yapıda ürün için widget yazacağız.
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
