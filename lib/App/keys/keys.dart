import 'package:flutter/material.dart';

class Keys {
  final parkRegisterKey = GlobalKey<FormState>(debugLabel: 'parkRegisterKey');
  final loginKey = GlobalKey<FormState>(debugLabel: 'loginKey');
  final registerKey = GlobalKey<FormState>(debugLabel: 'registerKey');
  final changePassKey = GlobalKey<FormState>(debugLabel: 'changePassKey');
  final vehicleKey = GlobalKey<FormState>(debugLabel: 'vehicleKey');
  final removeVehicleKey = GlobalKey<FormState>(debugLabel: 'removeVehicleKey');
  final vacancyKey = GlobalKey<FormState>(debugLabel: 'vacancyKey');
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKey');
}
