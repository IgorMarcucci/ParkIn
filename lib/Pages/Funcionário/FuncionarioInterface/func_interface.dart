import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/App/Models/func_interface_model.dart';
import 'package:flutter_app/App/Models/login_controller.dart';
import 'package:flutter_app/App/controllers/firebase_controllers.dart';
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
    var uid = FirebaseAuth.instance.currentUser!.uid;
    log('Funcionario interface - Build');
    LoginController loginController = context.read<LoginController>();
    FuncInterfaceModel interfaceModel = context.read<FuncInterfaceModel>();
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
            FirebaseFunctions().logout();
            loginController.clearControllers();
            interfaceModel.clearControllers();
            interfaceModel.clearAllList();
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
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('estacionamentos')
                  .where('uid', isEqualTo: uid)
                  .get()
                  .then(
                (value) {
                  if (value.docs.isNotEmpty) {
                    if (interfaceModel.placa.isNotEmpty) {
                      interfaceModel.clearAllList();
                      for (var element in value.docs) {
                        interfaceModel.addListObject(
                          element.data()['placa'],
                          element.data()['marca'],
                          element.data()['modelo'],
                        );
                      }
                    } else if (interfaceModel.placa.isEmpty) {
                      for (var element in value.docs) {
                        interfaceModel.addListObject(
                          element.data()['placa'],
                          element.data()['marca'],
                          element.data()['modelo'],
                        );
                      }
                    }
                  }
                },
              ),
              builder: ((context, snapshot) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(30, 15, 30, 35),
                  width: MediaQuery.of(context).size.width * 0.98,
                  decoration: tema.decorationContainer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                          'Vagas disponíveis: ${interfaceModel.vagasDisp()}',
                          style: tema.textstylesTitle),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      AutoSizeText(
                        'Vagas ocupadas: ${interfaceModel.placa.length}',
                        style: tema.textstylesTitle,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      const ButtonAreaFuncInterface(),
                    ],
                  ),
                );
              }),
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
                            ((route) => false)));
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
                              Navigator.of(context).pop();
                            },
                            callback: () {
                              if (formKey.currentState!.validate()) {
                                interfaceModel.setVagasTotais();
                                interfaceModel.clearControllers();
                                Navigator.of(context).pop();
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
