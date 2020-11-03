import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static StorageService _instance;
  static SharedPreferences _preferences;
  static Future<StorageService> getInstance() async {
    if (_instance == null) {
      _instance = StorageService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }
}
