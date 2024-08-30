import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static AppLocalStorage get to => GetIt.instance.get();
  late final SharedPreferences _sharedPrefs;

  Future<AppLocalStorage> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return _sharedPrefs.setString(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return _sharedPrefs.setInt(key, value);
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> setBool(String key, bool value) async {
    return _sharedPrefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return _sharedPrefs.setStringList(key, value);
  }

  String? getString(String key) {
    return _sharedPrefs.getString(key);
  }

  int? getInt(String key) {
    return _sharedPrefs.getInt(key);
  }

  bool? getBool(String key) {
    return _sharedPrefs.getBool(key);
  }

  List<String>? getList(String key) {
    return _sharedPrefs.getStringList(key);
  }

  Future<bool> remove(String key) async {
    return _sharedPrefs.remove(key);
  }
}
