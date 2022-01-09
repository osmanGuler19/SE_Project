import 'package:flutter/material.dart';
import 'view/login.dart';
import 'viewmodel/productViewModel.dart';
import 'viewmodel/userViewModel.dart';
import 'viewmodel/orderViewModel.dart';
import 'package:provider/provider.dart';

void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('uygulama açıldı');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductViewModel>(
            create: (_) => ProductViewModel()),
        ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
        ChangeNotifierProvider<OrderViewModel>(create: (_) => OrderViewModel()),
      ],
      child: MaterialApp(
        home: Login(),
      ),
    );
  }
}
