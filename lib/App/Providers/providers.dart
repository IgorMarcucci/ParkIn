import 'package:flutter_app/App/Providers/fields.provider.dart';
import 'package:flutter_app/App/Providers/park.provider.dart';
import 'package:flutter_app/App/Providers/user.provider.dart';
import 'package:flutter_app/App/Providers/vehicle.provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  parkProvider,
  userProvider,
  vehicleProvider,
  fieldsProvider,
];
