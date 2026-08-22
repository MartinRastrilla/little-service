class Env {
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://10.0.2.2:5278/api',
  );

  static const String mediaBaseUrl = String.fromEnvironment(
    'MEDIA_BASE_URL',
    defaultValue: 'http://10.0.2.2:5278',
  );

  static const String hubUrl = String.fromEnvironment(
    'HUB_URL',
    defaultValue: 'http://10.0.2.2:5278/hubs/chat',
  );
}
