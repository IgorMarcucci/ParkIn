import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Models/func_interface_model.dart';
import 'package:flutter_app/Views/Colaborator/CarroPage/carro_page.dart';
import 'package:flutter_app/Views/Colaborator/FuncionarioInterface/func_interface.dart';
import 'package:flutter_app/Views/Colaborator/Widgets/button_list.dart';
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
    FuncInterfaceModel interfaceModel = context.read<FuncInterfaceModel>();
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
        itemCount: interfaceModel.placa.length,
        itemBuilder: (context, index) {
          return ButtonList(
            callback: () {
              Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => CarroPage(
                            index: index,
                          )),
                  (route) => false));
            },
            height: 130,
            width: MediaQuery.of(context).size.width * 0.7,
            text: interfaceModel.placa[index].toString(),
            secondText: interfaceModel.modelo[index].toString(),
            thirdText: interfaceModel.marca[index].toString(),
            vagaCounter: (index + 1).toString(),
          );
        },
      ),
    );
  }
}
