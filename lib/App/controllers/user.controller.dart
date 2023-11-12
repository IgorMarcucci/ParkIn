import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/user.model.dart';

class UserController extends ChangeNotifier {
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  UserController(
      {
      required this.nameController,
      required this.usernameController,
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
      name: nameController.text,
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  UserModel setDataToChangePass() {
    return UserModel(email: emailController.text);
  }

  void clearControllers() {
    emailController.clear();
    nameController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    notifyListeners();
  }
}
