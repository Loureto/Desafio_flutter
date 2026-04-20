import '../../core.dart';

class Environment implements IEnvironment {
  const Environment._();

  static final instance = Environment._();

  @override
  String get baseUrl => const String.fromEnvironment('base_url');

  @override
  String get apiKey => const String.fromEnvironment('api_key');

  @override
  String get flavorType => const String.fromEnvironment('flavor_type');
}
