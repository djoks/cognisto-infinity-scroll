import 'package:cognisto_infinity_scroll/ui/views/customer/customer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> setupProviders() {
  return [ChangeNotifierProvider(create: (_) => CustomerViewModel())];
}
