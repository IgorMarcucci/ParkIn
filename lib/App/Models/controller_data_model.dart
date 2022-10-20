import 'package:flutter/cupertino.dart';

class ControllerDataModel extends ChangeNotifier {
  // Informações de dados coletados login
  String? email;
  String? name;
  String? cpf;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController cpfController;

  ControllerDataModel({
    this.cpf,
    this.email,
    required this.nameController,
    required this.emailController,
    required this.cpfController,
  });

  String? setEmailFromController() {
    email = emailController.text;
    return email;
  }

  String? setNameFromController() {
    name = nameController.text;
    return name;
  }

  String? setCpfFromController() {
    cpf = cpfController.text;
    return cpf;
  }

  clearControllers() {
    nameController.clear();
    cpfController.clear();
    emailController.clear();
    notf();
  }

  notf() {
    notifyListeners();
  }
}
