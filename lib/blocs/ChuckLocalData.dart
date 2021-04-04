import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xhp/models/user.dart';

class ChuckLocalData {
  static final OBJECT_USER = 'loginUserLocal';
  static final box = GetStorage();

  static getUser() async {
    var result;
    final prefs = await SharedPreferences.getInstance();
    result = prefs.getString('loginUserLocal');
    String strData = box.read(OBJECT_USER) ?? '$result';
    return User.fromJson(jsonDecode(strData));
  }

  static saveUser(user) {
    var s = json.encode(user);
    box.write(OBJECT_USER, s ?? '{}');
  }

  static clearAllData() {
    return box.erase();
  }
}
