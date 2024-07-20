import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage extends GetxService {
  static AppLocalStorage get to => Get.find();
  late final SharedPreferences _prefs;

  Future<AppLocalStorage> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return _prefs.setString(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return _prefs.setInt(key, value);
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> setBool(String key, bool value) async {
    return _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return _prefs.setStringList(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  List<String>? getList(String key) {
    return _prefs.getStringList(key);
  }

  Future<bool> remove(String key) async {
    return _prefs.remove(key);
  }
}
