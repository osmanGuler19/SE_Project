import 'package:flutter/material.dart';
import 'view/login.dart';
import 'package:gotur/viewmodel/productViewModel.dart';
import 'package:gotur/viewmodel/userViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductViewModel>(
            create: (_) => ProductViewModel()),
        ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
