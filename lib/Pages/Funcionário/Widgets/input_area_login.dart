import 'package:flutter/material.dart';
import 'package:flutter_app/FormFields/input_cpf.dart';
import 'package:flutter_app/FormFields/input_email.dart';
import 'package:flutter_app/FormFields/input_password.dart';
import 'package:flutter_app/Widgets/password_reset_button.dart';

class InputAreaLoginFunc extends StatelessWidget {
  const InputAreaLoginFunc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          const InputCpf(
            icon: Icon(Icons.perm_identity),
            text: 'Informe o seu CPF',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          const InputEmail(
            icon: Icon(Icons.email),
            text: "Insira seu email",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          const PasswordInput(
              icon: Icon(Icons.password), input: 'Insira sua senha'),
          const PasswordResetButton(),
        ],
      ),
    );
  }
}
