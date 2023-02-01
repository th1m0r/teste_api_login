import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_api_login/app/infra/local_storage/local_storage_interface.dart';

class LocalStorageService implements ILocalStorage {
  final SharedPreferences prefs;

  LocalStorageService({
    required this.prefs,
  });

  @override
  Future<bool> saveString(String key, String value) {
    return prefs.setString(key, value);
  }

  @override
  Future<bool> saveMap(String key, Map<String, dynamic> value) {
    return saveString(key, jsonEncode(value));
  }

  @override
  String getString(String key, [String defaultValue = '']) {
    return prefs.getString(key) ?? defaultValue;
  }

  @override
  Map<String, dynamic> getMap(String key) {
    try {
      return jsonDecode(getString(key));
    } catch (_) {
      return {};
    }
  }

  @override
  Future<bool> remove(String key) async {
    return await prefs.remove(key);
  }
}
