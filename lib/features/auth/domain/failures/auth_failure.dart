class AuthFailure {
  final String message;

  const AuthFailure._({this.message = ''});

  factory AuthFailure.server([String message = 'Erro no servidor']) {
    return AuthFailure._(message: message);
  }

  factory AuthFailure.unexpected([String message = 'Erro inesperado']) {
    return AuthFailure._(message: message);
  }

  factory AuthFailure.timeout([String message = 'Tempo limite excedido']) {
    return AuthFailure._(message: message);
  }

  factory AuthFailure.notFound([String message = 'Registro não encontrado']) {
    return AuthFailure._(message: message);
  }

  factory AuthFailure.badRequest([String message = 'Requisição inválida']) {
    return AuthFailure._(message: message);
  }

  factory AuthFailure.unauthorized([String message = 'Não autorizado']) {
    return AuthFailure._(message: message);
  }
}
