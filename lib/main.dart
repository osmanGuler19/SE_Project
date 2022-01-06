import 'package:flutter/material.dart';
import 'package:gotur/auth/view/login.dart';
import 'package:build_runner/build_runner.dart';
import 'package:gotur/home/view/payment.dart';

void main() {
  runApp(const Login());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('category'),
        ),
        body: MySample(),
      ),
    );
  }
}
