import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class IStorageClient<T> {
  FutureOr<void> delete(String key);

  FutureOr<void> save(String key, T value);

  FutureOr<dynamic> read(String key);

  FutureOr<void> clear() {}

  FutureOr<ValueListenable> listenable({List<String>? keys}) {
    throw UnimplementedError();
  }
}
