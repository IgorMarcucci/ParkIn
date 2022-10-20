import 'package:flutter/material.dart';
import 'package:flutter_app/FormFields/input_cpf.dart';
import 'package:flutter_app/FormFields/input_email.dart';
import 'package:flutter_app/FormFields/input_name.dart';
import 'package:flutter_app/FormFields/input_password.dart';

class InputAreaRegisterFunc extends StatelessWidget {
  const InputAreaRegisterFunc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          const InputName(
            icon: Icon(Icons.person),
            text: 'Informe seu nome',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          const InputCpf(
            icon: Icon(Icons.perm_identity),
            text: 'Informe o seu CPF',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          const InputEmail(
            icon: Icon(Icons.email),
            text: "Informe seu email",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          const PasswordInput(
              icon: Icon(Icons.password), input: 'Informe sua senha'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          const PasswordInput(
              icon: Icon(Icons.password), input: 'Repita sua senha'),
        ],
      ),
    );
  }
}
