import 'package:flutter/material.dart';
import 'package:gotur/view/shopping_card.dart';
import '../model/product_model.dart';
import 'package:gotur/viewmodel/productViewModel.dart';
import 'package:gotur/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProductViewModel>(context);
    List<String> categories = vm.categories;
    List<ProductCard> products = vm.productcardlist;

    print(categories[0]);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ShoppingCard())),
                icon: Icon(Icons.shopping_cart))
          ],
          leading: IconButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "Arama Ekranına Gidildi!");
              },
              icon: Icon(Icons.search)),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text(categories[index]),
                        onPressed: () async {
                          vm.getProductCard(
                              vm.getProductsByCategory(categories[index]));
                        },
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Consumer<ProductViewModel>(builder: (_, a, child) {
                return getGridView(context, products);
              }),
            )
          ],
        ));
  }

  Widget getGridView(BuildContext context, List<ProductCard> products) {
    return (GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 250),
        itemCount: products.length,
        itemBuilder: (BuildContext ctx, index) {
          return (products[index]);
        }));
  }
}
