import 'package:cognisto_infinity_scroll/models/customer.dart';
import 'package:cognisto_infinity_scroll/ui/widgets/customer_item.dart';
import 'package:flutter/material.dart';

class CustomerList extends StatefulWidget {
  final List<Customer> customers;
  final ScrollController controller;
  final bool isLoading;

  const CustomerList(
    this.customers, {
    super.key,
    required this.controller,
    this.isLoading = false,
  });

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.controller,
      itemBuilder: (context, index) {
        if (index < widget.customers.length) {
          Customer customer = widget.customers[index];
          return CustomerItem(customer, count: index + 1);
        } else {
          if (widget.isLoading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        }
      },
      itemCount:
          widget.isLoading
              ? (widget.customers.length + 1)
              : widget.customers.length,
    );
  }
}
