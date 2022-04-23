import 'dart:convert';

import 'package:approval_app/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ApprovalLocalDataSource {
  Future<LoginModel?> getData();
  Future<bool?> saveDataLogin(String loginData);
}

class ApprovalLocalDataSourceImpl extends ApprovalLocalDataSource {
  final SharedPreferences sharedPreferences;

  ApprovalLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<LoginModel?> getData() async {
    final result = sharedPreferences.getString("login");
    if (result != null) {
      return LoginModel.fromJson(jsonDecode(result));
    } else {
      return null;
    }
  }

  @override
  Future<bool?> saveDataLogin(String loginData) async {
    try {
      await sharedPreferences.setString("login", loginData);
      return true;
    } catch (e) {
      return false;
    }
  }
}
