import 'package:flutter/material.dart';
import 'package:flutter_app/Models/user.model.dart';
import 'package:flutter_app/FormFields/input_cpf.dart';
import 'package:flutter_app/FormFields/input_email.dart';
import 'package:flutter_app/FormFields/input_name.dart';
import 'package:flutter_app/FormFields/input_password.dart';
import 'package:provider/provider.dart';

class InputAreaRegisterFunc extends StatelessWidget {
  const InputAreaRegisterFunc({Key? key}) : super(key: key);

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
            height: MediaQuery.of(context).size.height * 0.016,
          ),
          InputCpf(
            icon: const Icon(Icons.perm_identity),
            text: 'Informe o seu CPF',
            cpfController: loginController.cpfController,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.016,
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
