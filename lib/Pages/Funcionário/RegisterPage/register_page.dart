import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_app/App/Models/controller_data_model.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/FuncionarioInterface/func_interface.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/input_area_register.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/funcionario_page.dart';
import 'package:flutter_app/Widgets/line_title_page.dart';
import 'package:flutter_app/Widgets/park_in_area_register.dart';
import 'package:flutter_app/Widgets/main_button.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class RegisterPageFuncionario extends StatelessWidget {
  const RegisterPageFuncionario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    log('Register page - Build');
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    ControllerDataModel controllerDataModel =
        context.read<ControllerDataModel>();
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
                        controllerDataModel.clearControllers();
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
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.7,
                      text: 'Cadastrar',
                      callback: () {
                        if (formKey.currentState!.validate()) {
                          Future.microtask(() => Navigator.of(context)
                              .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FuncInterface()),
                                  (route) => false));
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
