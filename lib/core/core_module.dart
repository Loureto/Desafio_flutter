import 'package:flutter_modular/flutter_modular.dart';

import 'core.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) => [
    i.addInstance<IHttpClient>(
      HttpAdapter.httpClientBuilder(
        baseUrl: Environment.instance.baseUrl,
        headers: {
          'content-type': 'application/json; charset=utf-8',
          'accept': 'application/json',
          'apikey': Environment.instance.apiKey,
        },
      ),
    ),

    i.addLazySingleton<ISecureStorageAdapter>(SecureStorageAdapter.new),

    i.addLazySingleton<IAuthTokenStorageAdapter>(AuthTokenStorageAdapter.new),

    i.addLazySingleton<IStorageClient>(() => LocalStorageClient()),
  ];
}
