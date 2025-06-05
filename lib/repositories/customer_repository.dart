import 'package:cognisto_infinity_scroll/models/customer.dart';
import 'package:cognisto_infinity_scroll/services/api_service.dart';
import 'package:cognisto_infinity_scroll/utils/locator.dart';

class CustomerRepository {
  final ApiService _apiService = locator<ApiService>();

  Future<List<Customer>> getCustomers({int limit = 10, int skip = 0}) async {
    try {
      final response = await _apiService.get(
        "users",
        params: {"limit": limit, "skip": skip},
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        final List users = data["users"];

        return users.map((json) => Customer.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw ('Unable to get customers.');
    }
  }

  Future<List<Customer>> searchCustomers(
    String query, {
    int limit = 15,
    int skip = 0,
  }) async {
    try {
      final response = await _apiService.get(
        'users/search',
        params: {"q": query, "limit": limit, "skip": skip},
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        final List users = data["users"];

        return users.map((json) => Customer.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw ('Unable to find customers: $query');
    }
  }
}
