const String kBaseUrl = String.fromEnvironment(
  'BASE_URL',
  defaultValue: 'https://dummyjson.com/',
);
const Duration kConnectionTimeout = Duration(seconds: 30);
