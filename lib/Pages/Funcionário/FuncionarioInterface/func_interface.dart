import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_app/App/Models/func_interface_model.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/ListaVagas/list_veiculos.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/button_area_func_interface.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/insert_vagas.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/Widgets/buttons_with_border.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class FuncInterface extends StatelessWidget {
  const FuncInterface({super.key});

  @override
  Widget build(BuildContext context) {
    
    log('Funcionario interface - Build');
    FuncInterfaceModel interfaceModel = context.watch<FuncInterfaceModel>();
    final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Funcionário',
        ),
        leading: IconButton(
          onPressed: () {
            Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false));
            interfaceModel.clearControllers();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 15, 30, 35),
              width: MediaQuery.of(context).size.width * 0.98,
              decoration: tema.decorationContainer,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Vagas disponíveis: ${interfaceModel.vagasDisp()}',
                      style: tema.textstylesTitle),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    'Vagas ocupadas: ${interfaceModel.vagasOcupadas}',
                    style: tema.textstylesTitle,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  const ButtonAreaFuncInterface(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                ButtonBorders(
                  callback: () {
                    Future.microtask(() => Navigator.of(context)
                        .pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const ListaVagasPage()),
                            (route) => false));
                  },
                  text: 'Lista de vagas',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                ButtonBorders(
                  callback: () {
                    showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return InputVagas(
                            callbackButtonBack: () {
                              interfaceModel.clearControllers();
                              Navigator.pop(context);
                            },
                            callback: () {
                              if (formKey.currentState!.validate()) {
                                interfaceModel.setVagasTotais();
                                interfaceModel.clearControllers();
                                Navigator.pop(context);
                              }
                            },
                          );
                        });
                  },
                  text: 'Inserir Nº de vagas',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
