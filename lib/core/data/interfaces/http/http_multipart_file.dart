import 'dart:io';

///HTTP multipart file.
class HttpMultipartFile {
  const HttpMultipartFile({required this.field, required this.file});

  final String field;
  final File file;
}
