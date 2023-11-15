import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_app/App/controllers/user.controller.dart';
import 'package:flutter_app/App/controllers/firebase.controller.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/input_area_register.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/funcionario_page.dart';
import 'package:flutter_app/Widgets/line_title_page.dart';
import 'package:flutter_app/Widgets/park_in_area_register.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/Widgets/scaffold_messages.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class RegisterPageFuncionario extends StatefulWidget {
  const RegisterPageFuncionario({Key? key}) : super(key: key);

  @override
  State<RegisterPageFuncionario> createState() => _RegisterPageFuncionarioState();
}

class _RegisterPageFuncionarioState extends State<RegisterPageFuncionario> {
  @override
  Widget build(BuildContext context) {
    
    log('Register page - Build');
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    FirebaseController firebaseController = FirebaseController();
    UserController userController =
        context.read<UserController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: tema.decorationButton,
        child: Form(
          key: keys.registerKey,
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                color: const Color.fromARGB(0, 207, 54, 54),
                child: Center(
                  child: ParkInAreaGlobal(
                    textInput: 'Cadastro',
                    callback: () {
                      Future.microtask(() {
                        userController.clearControllers();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const FuncionarioPage()),
                            (route) => false);
                      });
                    },
                    icon: const Icon(Icons.keyboard_return),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: tema.paletteDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const LineTitlePage(text: 'Funcionário:'),
                    const InputAreaRegisterFunc(),
                    MainButton(
                      height: 42,
                      width: MediaQuery.of(context).size.width * 0.6,
                      text: 'Cadastrar',
                      callback: () {
                        if (keys.registerKey.currentState!.validate()) {
                          if (userController
                                  .confirmPasswordController.text ==
                              userController.passwordController.text) {
                            firebaseController.createAccount(context, userController.setDataToRegister());
                            userController.clearControllers();
                            
                          } else {
                            message(
                                context, "As senhas devem ser iguais.");
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
