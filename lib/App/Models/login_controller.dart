import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  // Informações de dados coletados login
  String? email;
  String? name;
  String? password;
  String? passwordConfirm;
  String? cpf;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;
  late TextEditingController cpfController;

  LoginController({
    this.password,
    this.name,
    this.email,
    this.passwordConfirm,
    this.cpf,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.passwordConfirmController,
    required this.cpfController,
  });

  setDataFromControllers() {
    name = nameController.text;
    email = emailController.text;
    password = passwordController.text;
    passwordConfirm = passwordConfirmController.text;
    cpf = cpfController.text;
    notf();
  }

  setNameAndEmailData(data1) {
    name = data1;
    notf();
  }

  clearControllers() {
    nameController.clear();
    passwordController.clear();
    emailController.clear();
    passwordConfirmController.clear();
    cpfController.clear();
    notf();
  }

  notf() {
    notifyListeners();
  }
}
