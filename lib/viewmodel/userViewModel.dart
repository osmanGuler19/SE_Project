// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../model/user_model.dart';
import 'package:provider/provider.dart';
import '../model/product_model.dart';

class UserViewModel extends ChangeNotifier {
  late User? currentUser;

  UserViewModel() {
    currentUser = null;
  }

  Future<void> checkUser(String email, String password) async {
    final String response = await rootBundle.loadString('assets/users.json');
    print('bura');
    final data = await json.decode(response)['users'] as List;

    for (int i = 0; i < data.length; i++) {
      if (data[i]['email'] == email && data[i]['password'] == password) {
        currentUser = User.fromJson(data[i]);
        break;
      }
    }
  }

  bool isManager() {
    if (currentUser!.role.toLowerCase() == 'manager') {
      return true;
    }
    return false;
  }
}
