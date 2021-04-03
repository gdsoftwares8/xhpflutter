import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:xhp/models/user.dart';

class ChuckLocalData {
  static final OBJECT_USER = 'loginUserLocal';
  static final box = GetStorage();

  static User getUser() {
    String strData = box.read(OBJECT_USER) ?? '{}';
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
