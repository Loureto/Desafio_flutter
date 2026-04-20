class RoutesConstants {
  const RoutesConstants._();

  // Initial route
  static const String initialRoute = '/';

  // Splash route
  static const String splashRoute = '/splash';

  // Auth routes
  static const String authRoute = '/auth';
  static const String signInRoute = '/sign-in';
  static const String signUpRoute = '/sign-up';

  // Home routes
  static const String homeRoute = '/home';
  static const String annotationListRoute = '/annotation-list';
  static const String addAnnotationRoute = '/add-annotation';
  static const String annotationDetailRoute = '/annotation-detail';
}

extension RoutesConstantsExtension on String {
  String get auth => '${RoutesConstants.authRoute}$this';
  String get home => '${RoutesConstants.homeRoute}$this';
}
