import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class BaseException extends Equatable implements Exception {
  final String message;

  final String? label;

  final dynamic exception;

  final StackTrace? stackTrace;

  BaseException({required this.message, this.label, this.exception, this.stackTrace}) {
    if (stackTrace != null) {
      debugPrintStack(label: label, stackTrace: stackTrace);
    }
  }
  @override
  List<Object?> get props => [message, label, exception];
}
