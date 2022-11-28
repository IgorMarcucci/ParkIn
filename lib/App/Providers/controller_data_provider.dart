import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/login_controller.dart';
import 'package:provider/provider.dart';

ChangeNotifierProvider loginControllerProvider =
    ChangeNotifierProvider<LoginController>(
  create: (context) => LoginController(
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
    nameController: TextEditingController(),
    passwordConfirmController: TextEditingController(),
    cpfController: TextEditingController(),
  ),
);
