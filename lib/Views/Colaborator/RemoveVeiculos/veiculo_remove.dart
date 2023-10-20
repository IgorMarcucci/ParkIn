import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/func_interface_model.dart';
import 'package:flutter_app/Views/Colaborator/FuncionarioInterface/func_interface.dart';
import 'package:flutter_app/Views/Colaborator/Widgets/button_list.dart';
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
        itemCount: interfaceModel.placa.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) {
              interfaceModel.remover(context, index);
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
