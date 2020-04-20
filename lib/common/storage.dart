import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<String> get(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(key);
  }

  static Future<void> set(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static Future<void> setJSON(String key, value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    value = json.encode(value); //对value进行编码，将对象传递给json.encode方法
    preferences.setString(key, value);
  }

  static Future<void> remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }
}
