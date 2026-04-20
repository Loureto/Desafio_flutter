import 'package:equatable/equatable.dart';

abstract class IStorageException extends Equatable implements Exception {
  final String cause;

  const IStorageException({required this.cause});

  @override
  List<Object?> get props => [cause];
}

class SaveLocalStorageException extends IStorageException {
  const SaveLocalStorageException({required super.cause});
}

class FetchLocalStorageException extends IStorageException {
  const FetchLocalStorageException({required super.cause});
}

class DeleteLocalStorageException extends IStorageException {
  const DeleteLocalStorageException({required super.cause});
}
