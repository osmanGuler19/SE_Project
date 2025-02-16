import 'package:flutter/material.dart';
import 'package:gotur/viewmodel/productViewModel.dart';
import 'package:provider/provider.dart';
import 'package:gotur/view/payment.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProductViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text('Shopping Card'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              itemCount: vm.shoppingcard.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(vm.shoppingcard[index].imagePath),
                  title: Text(vm.shoppingcard[index].name),
                  subtitle: Text(vm.shoppingcard[index].price.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      vm.deleteFromShoppingCard(vm.shoppingcard[index]);
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Total: ${vm.totalAmount.toString()} TL',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.orange[900]),
            child: Text('Buy'),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Payment()));
            },
          ),
        ],
      ),
    );
  }
}
