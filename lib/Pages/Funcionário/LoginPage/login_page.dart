import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_app/App/Models/login_controller.dart';
import 'package:flutter_app/App/controllers/firebase_controllers.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/input_area_login.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/funcionario_page.dart';
import 'package:flutter_app/Widgets/line_title_page.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/Widgets/park_in_area_register.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class LoginPageFuncionario extends StatefulWidget {
  const LoginPageFuncionario({super.key});

  @override
  State<LoginPageFuncionario> createState() => _LoginPageFuncionarioState();
}

class _LoginPageFuncionarioState extends State<LoginPageFuncionario> {
  @override
  Widget build(BuildContext context) {
    LoginController loginController = context.read<LoginController>();
    log('Login page - Build');
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: tema.decorationButton,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                color: const Color.fromARGB(0, 207, 54, 54),
                child: Center(
                  child: ParkInAreaGlobal(
                    textInput: 'Login',
                    callback: () {
                      Future.microtask(() {
                        loginController.clearControllers();
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
                height: MediaQuery.of(context).size.height * 0.70,
                decoration: tema.paletteDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const LineTitlePage(text: 'Funcion??rio:'),
                    const InputAreaLoginFunc(),
                    MainButton(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.7,
                      text: 'Fazer Login',
                      callback: () {
                        if (formKey.currentState!.validate()) {
                          loginController.setDataFromControllers();
                          FirebaseFunctions().loginFuncionario(
                            context,
                            loginController.email,
                            loginController.password,
                          );
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
