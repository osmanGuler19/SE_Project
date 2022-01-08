import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  final int quantity;

  const ProductCard(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.price,
      required this.quantity})
      : super(key: key);

  //Buraya generic bir yapıda ürün için widget yazacağız.
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Expanded(
              child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          )),
          SizedBox(
            height: 10,
          ),
          Text(title),
          FittedBox(fit: BoxFit.scaleDown, child: Text(description)),
          SizedBox(
            height: 10,
          ),
          Text(price.toString()),
        ],
      ),
    );
  }
}
