import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/controllers/vehicle.controller.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/button_list.dart';
import 'package:provider/provider.dart';

class ListaVagasRemove extends StatelessWidget {
  const ListaVagasRemove({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VehicleController vehicleController = context.read<VehicleController>();
    log('Lista de veículos - Build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Remover Veículos',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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
          return Dismissible(
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) {
              // vehicleController.remover(context, index);
            },
            key: const Key('ola'),
            child: Center(
              child: ButtonList(
                callback: () {},
                height: 130,
                width: MediaQuery.of(context).size.width * 0.9,
                text: vehicleController.vehicleList[index].carPlate.toString(),
                secondText: vehicleController.vehicleList[index].modelName.toString(),
                thirdText: vehicleController.vehicleList[index].brandName.toString(),
                vagaCounter: (index + 1).toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
