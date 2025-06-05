import 'package:cognisto_infinity_scroll/constants/app.dart';
import 'package:cognisto_infinity_scroll/ui/views/customer/customer_view_model.dart';
import 'package:cognisto_infinity_scroll/ui/widgets/app_search_bar.dart';
import 'package:cognisto_infinity_scroll/ui/widgets/customer_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _scrollController.addListener(_onScroll);

      final vm = context.read<CustomerViewModel>();
      await vm.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CustomerViewModel>();

    return Scaffold(
      appBar: AppSearchBar(title: Text(kTitle), onChange: (value) {}),
      body: SafeArea(
        child: CustomerList(
          vm.customers,
          controller: _scrollController,
          isLoading: vm.isLoading,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onScroll() async {
    double currentScroll = _scrollController.position.pixels;
    double maxScroll = _scrollController.position.maxScrollExtent - 200;

    if (currentScroll >= maxScroll) {
      final vm = context.read<CustomerViewModel>();
      await vm.getMoreCustomers();
    }
  }
}
