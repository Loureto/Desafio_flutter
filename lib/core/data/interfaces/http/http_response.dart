import 'package:equatable/equatable.dart';

import 'http_status.dart';

class HttpResponse extends Equatable {
  final HttpStatus status;

  final dynamic data;

  const HttpResponse({required this.status, this.data});

  factory HttpResponse.success(
    Object? data, {
    HttpStatus status = HttpStatus.ok,
  }) {
    return HttpResponse(status: status, data: data);
  }

  factory HttpResponse.empty({HttpStatus status = HttpStatus.noContent}) {
    return HttpResponse(status: status);
  }

  @override
  List<Object?> get props => [status, data];
}
