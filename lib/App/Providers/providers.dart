import 'package:flutter_app/App/Providers/controller_data_provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_app/App/Providers/func_interface_provider.dart';

List<SingleChildWidget> appProviders = [
  funcInterfaceModelProvider,
  loginControllerProvider,
];
