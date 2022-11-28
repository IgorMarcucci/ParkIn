import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/controller_data_model.dart';
import 'package:provider/provider.dart';

ChangeNotifierProvider controllerDataModelProvider =
    ChangeNotifierProvider<ControllerDataModel>(
  create: (context) => ControllerDataModel(
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
    nameController: TextEditingController(),
    passwordConfirmController: TextEditingController(),
    cpfController: TextEditingController(),
  ),
);
