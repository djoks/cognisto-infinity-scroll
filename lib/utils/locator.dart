import 'package:cognisto_infinity_scroll/repositories/customer_repository.dart';
import 'package:cognisto_infinity_scroll/services/api_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerSingleton<ApiService>(ApiService());

  // Repositories
  locator.registerSingleton<CustomerRepository>(CustomerRepository());
}
