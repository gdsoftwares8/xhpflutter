import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xhp/models/account-model.dart';
import 'package:xhp/models/user.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckLocalData {
  static final OBJECT_USER = 'loginUserLocal';
  static final OBJECT_Account = 'useraccount';
  static final box = GetStorage();

  static getUser() async {
    var result;
    final prefs = await SharedPreferences.getInstance();
    result = prefs.getString('user');
    String strData = box.read(OBJECT_USER) ?? '$result';
    return User.fromJson(jsonDecode(strData));
  }

  static getAccount() async {
    var result;
    final prefs = await SharedPreferences.getInstance();
    result = prefs.getString(GlobalVars.account);
    return AccountModel.fromJson(jsonDecode(result));
  }

  static saveUser(user) {
    var s = json.encode(user);
    box.write(OBJECT_USER, s ?? '{}');
  }

  static saveAccount(account) {
    var s = json.encode(account);
    box.write(OBJECT_Account, s ?? '{}');
  }

  static clearAllData() {
    return box.erase();
  }
}
