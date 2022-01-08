import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Container(child: ClipRRect(child: Image.asset('banana.jpg')))
      ]),
    ));
  }
}
