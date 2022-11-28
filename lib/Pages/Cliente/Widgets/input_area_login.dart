import 'package:flutter/material.dart';
import 'package:flutter_app/FormFields/input_email.dart';
import 'package:flutter_app/FormFields/input_password.dart';
import 'package:flutter_app/Widgets/password_reset_button.dart';
import 'package:provider/provider.dart';

import '../../../App/Models/login_controller.dart';

class InputAreaLoginCliente extends StatelessWidget {
  const InputAreaLoginCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = context.read<LoginController>();
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          InputEmail(
            icon: const Icon(Icons.email),
            text: "Insira seu email",
            emailController: loginController.emailController,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          PasswordInput(
            icon: const Icon(Icons.password),
            input: 'Insira sua senha',
            passwordController: loginController.passwordController,
          ),
          const PasswordResetButton(),
        ],
      ),
    );
  }
}
