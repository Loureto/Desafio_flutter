import '../../data.dart';

/// HTTP request options
class HttpMultipartOptions {
  const HttpMultipartOptions({required this.files, this.fields});

  final List<HttpMultipartFile> files;
  final Map<String, String>? fields;
}
