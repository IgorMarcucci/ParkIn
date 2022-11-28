import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/login_controller.dart';
import 'package:flutter_app/FormFields/input_email.dart';
import 'package:flutter_app/FormFields/input_name.dart';
import 'package:flutter_app/FormFields/input_password.dart';
import 'package:provider/provider.dart';

class InputAreaRegisterCliente extends StatelessWidget {
  const InputAreaRegisterCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = context.read<LoginController>();
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          InputName(
            icon: const Icon(Icons.person),
            text: 'Informe seu nome',
            nameController: loginController.nameController,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          InputEmail(
            icon: const Icon(Icons.email),
            text: "Informe seu email",
            emailController: loginController.emailController,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          PasswordInput(
            icon: const Icon(Icons.password),
            input: 'Informe sua senha',
            passwordController: loginController.passwordController,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          PasswordInput(
            icon: const Icon(Icons.password),
            input: 'Repita sua senha',
            passwordController: loginController.passwordConfirmController,
          ),
        ],
      ),
    );
  }
}
