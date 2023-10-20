import 'package:flutter/material.dart';
import 'package:flutter_app/Controllers/user.controller.dart';
import 'package:provider/provider.dart';

ChangeNotifierProvider userProvider = ChangeNotifierProvider<UserController>(
  create: (context) => UserController(
      usernameController: TextEditingController(),
      passwordController: TextEditingController(),
      emailController: TextEditingController(),
      confirmPasswordController: TextEditingController()),
);
 