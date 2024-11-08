import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<void> init();
  Future<bool> setString(String key, String value);
  Future<bool> setInt(String key, int value);
  Future<bool> setBool(String key, bool value);
  Future<bool> setList(String key, List<String> value);
  String? getString(String key);
  int? getInt(String key);
  bool? getBool(String key);
  List<String>? getList(String key);
  Future<bool> remove(String key);
}

class LocalStorageImpl extends LocalStorage {
  late final SharedPreferences _sharedPrefs;
  @override
  bool? getBool(String key) {
    return _sharedPrefs.getBool(key);
  }

  @override
  int? getInt(String key) {
    return _sharedPrefs.getInt(key);
  }

  @override
  List<String>? getList(String key) {
    return _sharedPrefs.getStringList(key);
  }

  @override
  String? getString(String key) {
    return _sharedPrefs.getString(key);
  }

  @override
  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> remove(String key) async {
    return _sharedPrefs.remove(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return _sharedPrefs.setBool(key, value);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return _sharedPrefs.setInt(key, value);
  }

  @override
  Future<bool> setList(String key, List<String> value) async {
    return _sharedPrefs.setStringList(key, value);
  }

  @override
  Future<bool> setString(String key, String value) async {
    return _sharedPrefs.setString(key, value);
  }
  
}
