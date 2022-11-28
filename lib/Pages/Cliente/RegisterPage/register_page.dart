import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_app/App/Models/login_controller.dart';
import 'package:flutter_app/App/controllers/firebase_controllers.dart';
import 'package:flutter_app/Pages/Cliente/Widgets/input_area_register.dart';
import 'package:flutter_app/Pages/Cliente/cliente_page.dart';
import 'package:flutter_app/Widgets/line_title_page.dart';
import 'package:flutter_app/Widgets/park_in_area_register.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class RegisterPageCliente extends StatefulWidget {
  const RegisterPageCliente({Key? key}) : super(key: key);

  @override
  State<RegisterPageCliente> createState() => _RegisterPageClienteState();
}

class _RegisterPageClienteState extends State<RegisterPageCliente> {
  @override
  Widget build(BuildContext context) {
    LoginController loginController =
        context.read<LoginController>();
    log('Register page cliente - Build');
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    // LoginController LoginController = context.read<LoginController>();
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
                    textInput: 'Cadastro',
                    callback: () {
                      Future.microtask(() {
                        loginController.clearControllers();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const ClientePage()),
                            (route) => false);
                      });
                    },
                    icon: const Icon(Icons.keyboard_return),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.71,
                decoration: tema.paletteDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const LineTitlePage(text: 'Cliente:'),
                    const InputAreaRegisterCliente(),
                    MainButton(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.7,
                      text: 'Cadastrar',
                      callback: () {
                        if (formKey.currentState!.validate()) {
                          loginController.setDataFromControllers();
                          FirebaseFunctions().criarContaCliente(context, loginController.email, loginController.password, loginController.name);
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
