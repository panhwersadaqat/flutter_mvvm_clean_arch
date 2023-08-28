import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clearn_arch/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserViewModel with ChangeNotifier{

  Future<void> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    // Convert Data model to JSON and save it as a string
    final dataJson = json.encode(user.data?.toJson() ?? {});
    await sp.setString('user_data', dataJson);

    // Notify listeners that the user has been saved
    notifyListeners();
  }

  Future<UserModel?> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    // Load data JSON from SharedPreferences
    final dataJson = sp.getString('user_data');
    if (dataJson != null) {
      final dataMap = json.decode(dataJson) as Map<String, dynamic>;
      return UserModel(data: Data.fromJson(dataMap), status: 200, message: 'Success');
    } else {
      return null;
    }
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('user_data');
    return true;
  }


}