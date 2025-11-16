class AppConstants {
  // API Constants
  static const String baseUrl = 'https://api.bedrindia.com/v1';
  static const String imageBaseUrl = 'https://media2.bedrindia.com';
  
  // App Info
  static const String appName = 'Bedr';
  static const String appVersion = '1.0.0';
}

class AppRoutes {
  // Route Names
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';
  static const String properties = '/properties';
  static const String propertyDetail = '/property/:id';
  static const String search = '/search';
  static const String favorites = '/favorites';
  static const String settings = '/settings';
  
  // Route Paths
  static String propertyDetailPath(String id) => '/property/$id';
}
