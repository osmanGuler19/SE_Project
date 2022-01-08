import 'package:flutter/material.dart';
import 'package:gotur/model/product_model.dart';
import 'package:provider/provider.dart';
import 'package:gotur/viewmodel/productViewModel.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

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
            product.imagePath,
            fit: BoxFit.contain,
          )),
          SizedBox(
            height: 10,
          ),
          Text(product.name),
          FittedBox(fit: BoxFit.scaleDown, child: Text(product.description)),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.price.toString() + " TL"),
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
