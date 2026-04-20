import 'dart:io';

import 'package:logger/logger.dart';

abstract class Log {
  static final _logger = Logger(
    printer: Platform.isIOS ? PrettyPrinter(colors: false, printEmojis: true) : null,
  );

  /// Trace level
  static void t(Object? message, [dynamic data]) {
    _logger.t(message, error: data);
  }

  /// Info level
  static void i(Object? message, [dynamic data]) {
    _logger.i(message, error: data);
  }

  /// Debug level
  static void d(Object? message, [dynamic data]) {
    _logger.d(message, error: data);
  }

  /// Warning level
  static void w(Object? message, [dynamic data]) {
    _logger.w(message, error: data);
  }

  /// Error level
  static void e(Object? message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
