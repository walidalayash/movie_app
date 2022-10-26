import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'key_storage_service.dart';

/// Service that is responsible for storing/retrieving data in/from
/// local storage using the [SharedPreferences] package.
///
///

class KeyStorageServiceImpl implements KeyStorageService {
  final _log = Logger('KeyStorageServiceImpl');

  static KeyStorageServiceImpl? _instance;
  static SharedPreferences? _preferences;

  static const locale_key = 'locale_key';
  static const is_notification = 'is_notification_key';
  static const app_title_key = 'app_title_key';
  static const language_key = 'language_key';

  static Future<KeyStorageServiceImpl?> getInstance() async {
    _instance ??= KeyStorageServiceImpl();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  @override
  String get locale => getFromDisk(locale_key) ?? '';

  @override
  String get app_title => getFromDisk(app_title_key) ?? 'none';

  @override
  set locale(String? _user_token) {
    saveToDisk(locale_key, _user_token);
  }

  @override
  bool get isNotification => getFromDisk(is_notification) ?? false;
  @override
  String get language => getFromDisk(language_key) ?? 'en';
  @override
  set isNotification(bool? _user_token) {
    saveToDisk(is_notification, _user_token);
  }

  @override
  set app_title(String? value) {
    saveToDisk(app_title_key, value);
  }

  @override
  dynamic getFromDisk(String key) {
    final value = _preferences!.get(key);
    return value;
  }

  @override
  set language(String? value) {
    saveToDisk(language_key, value);
  }

  @override
  void saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }
  }

  @override
  void remove(String key) {
    _preferences!.remove(key);
  }

  @override
  Future<void> removeEveryThing() async {
    _preferences ??= await SharedPreferences.getInstance();
    await _preferences!.clear();
  }
}
