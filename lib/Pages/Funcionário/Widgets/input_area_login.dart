import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/user.controller.dart';
import 'package:flutter_app/FormFields/input_email.dart';
import 'package:flutter_app/FormFields/input_password.dart';
import 'package:flutter_app/Widgets/password_reset_button.dart';
import 'package:provider/provider.dart';

class InputAreaLoginFunc extends StatelessWidget {
  const InputAreaLoginFunc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = context.read<UserController>();
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          InputEmail(
            icon: const Icon(Icons.email),
            text: "Insira seu email",
            emailController: userController.emailController,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          PasswordInput(
            icon: const Icon(Icons.password),
            input: 'Insira sua senha',
            passwordController: userController.passwordController,
          ),
          const PasswordResetButton(),
        ],
      ),
    );
  }
}
