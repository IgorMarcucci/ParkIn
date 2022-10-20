import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/func_interface_model.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/FuncionarioInterface/func_interface.dart';
import 'package:flutter_app/Pages/Funcion%C3%A1rio/Widgets/button_list.dart';
import 'package:provider/provider.dart';

class ListaVagasRemove extends StatelessWidget {
  const ListaVagasRemove({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FuncInterfaceModel interfaceModel = context.read<FuncInterfaceModel>();
    log('Lista de veículos - Build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Remover Veículos',
        ),
        leading: IconButton(
          onPressed: () {
            Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const FuncInterface()),
                (route) => false));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: interfaceModel.placa.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) {
              // interfaceModel.removeListObject(index);
              interfaceModel.placa.removeAt(index);
              interfaceModel.modelo.removeAt(index);
              interfaceModel.marca.removeAt(index);
              interfaceModel.notf();
              interfaceModel.incrementVagasDisp();
            },
            key: const Key('ola'),
            child: Center(
              child: ButtonList(
                callback: () {},
                height: 130,
                width: MediaQuery.of(context).size.width * 0.9,
                text: interfaceModel.placa[index].toString(),
                secondText: interfaceModel.modelo[index].toString(),
                thirdText: interfaceModel.marca[index].toString(),
                vagaCounter: (index + 1).toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
