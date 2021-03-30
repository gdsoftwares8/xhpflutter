import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  readBoolean(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  readString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}