import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/user.model.dart';
import 'package:flutter_app/App/controllers/park.controller.dart';

import 'package:flutter_app/App/controllers/user.controller.dart';
import 'package:flutter_app/App/controllers/firebase.controller.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:flutter_app/App/services/storage.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/ListaVagas/list_veiculos.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/button_area_func_interface.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/insert_vagas.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/Widgets/buttons_with_border.dart';
import 'package:flutter_app/App/theme/custom_theme.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class FuncInterface extends StatefulWidget {
  const FuncInterface({super.key});

  @override
  State<FuncInterface> createState() => _FuncInterfaceState();
}

class _FuncInterfaceState extends State<FuncInterface> {
  UserModel user = UserModel();

  @override
  void initState() {
    StorageData storageData = StorageData();
    Map<String, dynamic> map =
        Map<String, dynamic>.from(storageData.readData('userData'));
    user = UserModel.fromJson(map);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseController firebaseController = FirebaseController();
    VehicleController vehicleController = context.read<VehicleController>();
    ParkController parkController = context.read<ParkController>();
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
            firebaseController.logout();
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
              future: firebaseController.getData(user, 'park'),
              builder: ((context, snapshot) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(30, 15, 30, 35),
                  width: MediaQuery.of(context).size.width * 0.98,
                  decoration: tema.decorationContainer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                          'Vagas disponíveis: ${parkController.listAvailableSpace(vehicleController.filteredVehicleList.length)}',
                          style: tema.textstylesTitle),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      AutoSizeText(
                        'Vagas ocupadas: ${vehicleController.filteredVehicleList.length}',
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
                              // vehicleController.clearControllers();
                              Navigator.of(context).pop();
                            },
                            callback: () {
                              // if (formKey.currentState!.validate()) {
                              //   interfaceModel.setVagasTotais();
                              //   interfaceModel.clearControllers();
                              //   Navigator.of(context).pop();
                              // }
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
