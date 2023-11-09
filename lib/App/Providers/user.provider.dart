import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/user.controller.dart';
import 'package:provider/provider.dart';

ChangeNotifierProvider userProvider =
    ChangeNotifierProvider<UserController>(
  create: (context) => UserController(
    nameController: TextEditingController(),
    confirmPasswordController: TextEditingController(),
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
    usernameController: TextEditingController(),
  ),
);
