import 'package:equatable/equatable.dart';

import 'http_status.dart';

abstract class IHttpException extends Equatable {
  final HttpStatus? status;

  final String message;

  final dynamic data;

  const IHttpException(this.status, {this.data, this.message = ''});

  @override
  List<Object?> get props => [status, data, message];
}

class BadRequestException extends IHttpException {
  const BadRequestException({HttpStatus? status, Object? data, String message = ''})
    : super(status ?? HttpStatus.badRequest, data: data, message: message);
}

class ForbiddenException extends IHttpException {
  const ForbiddenException({String message = '', Object? data})
    : super(HttpStatus.forbidden, data: data, message: message);
}

class InternalServerErrorException extends IHttpException {
  const InternalServerErrorException({String message = '', Object? data})
    : super(HttpStatus.internalServerError, data: data, message: message);
}

class NotFoundException extends IHttpException {
  const NotFoundException({String message = '', Object? data})
    : super(HttpStatus.notFound, data: data, message: message);
}

class UnprocessableEntityException extends IHttpException {
  const UnprocessableEntityException({String message = '', Object? data})
    : super(HttpStatus.unprocessableEntity, message: message, data: data);
}

class UnauthorizedException extends IHttpException {
  const UnauthorizedException({String message = '', Object? data})
    : super(HttpStatus.unauthorized, message: message, data: data);
}

class BadGatewayException extends IHttpException {
  const BadGatewayException({String message = '', Object? data})
    : super(HttpStatus.badGateway, data: data, message: message);
}

class ServiceUnavailableException extends IHttpException {
  const ServiceUnavailableException({String message = '', Object? data})
    : super(HttpStatus.serviceUnavailable, data: data, message: message);
}

class GatewayTimeoutException extends IHttpException {
  const GatewayTimeoutException({String message = '', Object? data})
    : super(HttpStatus.gatewayTimeout, data: data, message: message);
}

class TimeoutException extends IHttpException {
  const TimeoutException({String message = ''}) : super(null, message: message);
}
