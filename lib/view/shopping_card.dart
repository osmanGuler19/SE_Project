import 'package:flutter/material.dart';
import 'package:gotur/viewmodel/productViewModel.dart';
import 'package:provider/provider.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProductViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Card'),
      ),
      body: ListView.builder(
        itemCount: vm.shoppingcard.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(vm.shoppingcard[index].imagePath),
            title: Text(vm.shoppingcard[index].name),
            subtitle: Text(vm.products[index].price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                vm.deleteFromShoppingCard(vm.shoppingcard[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
