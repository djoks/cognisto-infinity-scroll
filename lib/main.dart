import 'package:cognisto_infinity_scroll/ui/views/customer/customer_view.dart';
import 'package:cognisto_infinity_scroll/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cognisto_infinity_scroll/utils/providers.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: setupProviders(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Cognisto Customer Viewer',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const CustomerView(),
        );
      },
    );
  }
}
