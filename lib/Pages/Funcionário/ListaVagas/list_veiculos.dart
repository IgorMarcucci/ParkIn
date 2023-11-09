import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/FuncionarioInterface/func_interface.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/button_list.dart';
import 'package:provider/provider.dart';

class ListaVagasPage extends StatefulWidget {
  const ListaVagasPage({Key? key}) : super(key: key);

  @override
  State<ListaVagasPage> createState() => _ListaVagasPageState();
}

class _ListaVagasPageState extends State<ListaVagasPage> {
  @override
  Widget build(BuildContext context) {
    log('Lista de veículos - Build');
    VehicleController vehicleController = context.read<VehicleController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Veículos',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const FuncInterface()),
              ((route) => false),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: vehicleController.vehicleList.length,
        itemBuilder: (context, index) {
          return ButtonList(
            callback: () {
              // Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(
              //         builder: (context) => CarroPage(
              //               index: index,
              //             )),
              //     (route) => false));
            },
            height: 130,
            width: MediaQuery.of(context).size.width * 0.7,
            text: vehicleController.vehicleList[index].carPlate.toString(),
            secondText: vehicleController.vehicleList[index].modelName.toString(),
            thirdText: vehicleController.vehicleList[index].brandName.toString(),
            vagaCounter: (index + 1).toString(),
          );
        },
      ),
    );
  }
}
