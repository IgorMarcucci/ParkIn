import 'package:flutter/material.dart';
import 'package:flutter_app/Models/user.model.dart';

class UserController extends ChangeNotifier {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  UserController(
      {required this.usernameController,
      required this.passwordController,
      required this.emailController,
      required this.confirmPasswordController});

  UserModel setDataToLogin() {
    return UserModel(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  UserModel setDataToRegister() {
    return UserModel(
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  UserModel setDataToChangePass() {
    return UserModel(email: emailController.text);
  }

  clearControllers() {
    emailController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    notifyListeners();
  }
}
