import 'package:cached_network_image/cached_network_image.dart';
import 'package:cognisto_infinity_scroll/models/customer.dart';
import 'package:flutter/material.dart';

class CustomerItem extends StatelessWidget {
  final Customer customer;
  final int count;

  const CustomerItem(this.customer, {super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: count.isEven ? Colors.grey.shade50 : Colors.white,
      leading: Badge(
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(count.toString()),
        ),
        backgroundColor: Colors.grey.shade200,
        textColor: Colors.grey.shade800,
      ),
      title: Text(customer.name),
      subtitle: Text(customer.email),
      trailing: CachedNetworkImage(
        imageUrl: customer.image,
        width: 48,
        height: 48,
      ),
    );
  }
}
