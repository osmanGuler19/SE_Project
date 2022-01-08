import 'package:flutter/material.dart';
import 'package:gotur/model/product_model.dart';
import 'package:provider/provider.dart';
import 'package:gotur/viewmodel/productViewModel.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final String imagePath;
  final String title;
  final String description;
  final double price;
  final int quantity;

  const ProductCard(
      {Key? key,
      required this.product,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.price,
      required this.quantity})
      : super(key: key);

  //Buraya generic bir yapıda ürün için widget yazacağız.
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProductViewModel>(context);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price.toString() + " TL"),
              IconButton(
                  onPressed: () {
                    vm.addToShoppingCard(product);
                  },
                  icon: Icon(Icons.add_circle)),
            ],
          ),
        ],
      ),
    );
  }
}
