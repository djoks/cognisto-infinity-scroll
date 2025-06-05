import 'package:cognisto_infinity_scroll/models/customer.dart';
import 'package:cognisto_infinity_scroll/repositories/customer_repository.dart';
import 'package:cognisto_infinity_scroll/utils/locator.dart';
import 'package:flutter/material.dart';

class CustomerViewModel with ChangeNotifier {
  final CustomerRepository _repo = locator<CustomerRepository>();

  List<Customer> _customers = [];
  List<Customer> get customers => _customers;

  final int _limit = 15;
  int get skip => customers.length;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  Future<void> init() async {
    _customers = await getCustomers();
    notifyListeners();
  }

  Future<List<Customer>> getCustomers() async {
    try {
      _isLoading = true;
      notifyListeners();

      List<Customer> customers = await _repo.getCustomers(
        limit: _limit,
        skip: skip,
      );

      _isLoading = false;

      return customers;
    } catch (e) {
      _isLoading = false;
      return [];
    }
  }

  Future<void> getMoreCustomers() async {
    if (_isLoading || !_hasMore) return;

    try {
      List<Customer> moreCustomers = await getCustomers();

      if (moreCustomers.isNotEmpty) {
        _customers.addAll(moreCustomers);
      } else {
        _hasMore = false;
      }

      notifyListeners();
    } catch (e) {
      throw ('Unable to fetch more customers.');
    }
  }
}
