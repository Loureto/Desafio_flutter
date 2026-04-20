class ApiConstants {
  const ApiConstants._();

  // AUTH
  static const String signIn = '/auth/v1/token?grant_type=password';

  static const String signUp = '/auth/v1/signup';

  static const String logout = '/auth/v1/logout';

  // HOME
  static String annotations({String? userId}) {
    final basePath = '/rest/v1/notes?select=*';

    if (userId == null || userId.trim().isEmpty) {
      return basePath;
    }

    return '$basePath&user_id=eq.$userId';
  }

  static const String insertAnnotation = '/rest/v1/notes';

  static String updateAnnotation(int id) => '/rest/v1/notes?id=eq.$id';

  static String deleteAnnotation(int id) => '/rest/v1/notes?id=eq.$id';
}
