import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core.dart';

abstract class ISecureStorageAdapter {
  Future<String?> read(String key);

  Future<void> write(String key, String value);

  Future<void> delete(String key);

  Future<void> clear();

  Future<void> writeJson(String key, Map<String, dynamic> json);

  Future<Map<String, dynamic>?> readJson(String key);
}

class SecureStorageAdapter implements ISecureStorageAdapter {
  static final SecureStorageAdapter _instance = SecureStorageAdapter._();
  final FlutterSecureStorage _storage;

  static const _androidOptions = AndroidOptions(encryptedSharedPreferences: true);

  static const _iosOptions = IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  SecureStorageAdapter._({FlutterSecureStorage? storage})
    : _storage =
          storage ?? const FlutterSecureStorage(aOptions: _androidOptions, iOptions: _iosOptions);

  factory SecureStorageAdapter() => _instance;

  @override
  Future<String?> read(String key) async {
    try {
      final String? value = await _storage.read(key: key);
      Log.i(
        'SecureStorageAdapter: Read key "$key" with value "${value != null ? "****" : "null"}"',
      );
      return value;
    } catch (e, s) {
      Log.e('Error reading key "$key": $e', s);
      rethrow;
    }
  }

  @override
  Future<void> write(String key, String value) async {
    if (key.isEmpty || value.isEmpty) {
      throw ArgumentError('Key and value cannot be empty');
    }
    try {
      await _storage.write(key: key, value: value);
      Log.i('SecureStorageAdapter: Wrote key "$key"');
    } catch (e, s) {
      Log.e('Error writing key "$key": $e', s);
      rethrow;
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
      Log.i('SecureStorageAdapter: Deleted key "$key"');
    } catch (e, s) {
      Log.e('Error deleting key "$key": $e', s);
      rethrow;
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _storage.deleteAll();
      if (kDebugMode) Log.i('SecureStorageAdapter: Cleared all keys');
    } catch (e, s) {
      if (kDebugMode) Log.e('Error clearing all keys: $e', s);
      rethrow;
    }
  }

  @override
  Future<void> writeJson(String key, Map<String, dynamic> json) async {
    final String jsonString = jsonEncode(json);
    await write(key, jsonString);
    Log.i('SecureStorageAdapter: Wrote JSON key "$key"');
  }

  @override
  Future<Map<String, dynamic>?> readJson(String key) async {
    final String? jsonString = await read(key);
    Log.i('SecureStorageAdapter: Read JSON key "$key"');
    return jsonString != null ? jsonDecode(jsonString) as Map<String, dynamic> : null;
  }
}
