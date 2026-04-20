class HomeFailure {
  final String message;

  const HomeFailure._({this.message = ''});

  factory HomeFailure.server([String message = 'Erro no servidor']) {
    return HomeFailure._(message: message);
  }

  factory HomeFailure.unexpected([String message = 'Erro inesperado']) {
    return HomeFailure._(message: message);
  }

  factory HomeFailure.timeout([String message = 'Tempo limite excedido']) {
    return HomeFailure._(message: message);
  }

  factory HomeFailure.notFound([String message = 'Registro não encontrado']) {
    return HomeFailure._(message: message);
  }

  factory HomeFailure.badRequest([String message = 'Requisição inválida']) {
    return HomeFailure._(message: message);
  }

  factory HomeFailure.unauthorized([String message = 'Não autorizado']) {
    return HomeFailure._(message: message);
  }

  factory HomeFailure.forbidden([String message = 'Acesso negado']) {
    return HomeFailure._(message: message);
  }
}
