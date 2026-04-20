import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core.dart';

class LocalStorageClient extends IStorageClient<String> {
  @override
  Future<void> delete(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.remove(key);
    } catch (error) {
      Log.e('Delete failed', error);
      throw DeleteLocalStorageException(cause: error.toString());
    }
  }

  @override
  Future read(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      return prefs.get(key);
    } catch (error) {
      Log.e('Fetch failed', error);
      throw FetchLocalStorageException(cause: error.toString());
    }
  }

  @override
  Future<void> save(String key, value) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(key, value);
    } catch (error) {
      Log.e('Save failed', error);
      throw SaveLocalStorageException(cause: error.toString());
    }
  }
}
