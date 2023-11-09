import 'package:flutter/material.dart';

class Keys {
  final loginKey = GlobalKey<FormState>(debugLabel: 'loginKey');
  final registerKey = GlobalKey<FormState>(debugLabel: 'registerKey');
  final changePassKey = GlobalKey<FormState>(debugLabel: 'changePassKey');
  final vehicleKey = GlobalKey<FormState>(debugLabel: 'vehicleKey');
  final vacancyKey = GlobalKey<FormState>(debugLabel: 'vacancyKey');
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKey');
}
