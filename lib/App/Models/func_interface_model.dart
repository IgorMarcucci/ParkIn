import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/scaffold_messages.dart';

import '../../Pages/Funcionário/FuncionarioInterface/func_interface.dart';

String md5RandomString() {
  final randomNumber = Random().nextDouble();
  final randomBytes = utf8.encode(randomNumber.toString());
  final randomString = md5.convert(randomBytes).toString();
  return randomString;
}

class FuncInterfaceModel extends ChangeNotifier {
  int vagasTotais = 30;
  int vagasOcupadas = 0;

  late TextEditingController vagasController;

  // Informações de veículos para lista
  List<String> marca = [];
  List<String> placa = [];
  List<String> modelo = [];

  late TextEditingController marcaController;
  late TextEditingController placaController;
  late TextEditingController modeloController;

  FuncInterfaceModel({
    required this.vagasController,
    required this.marcaController,
    required this.modeloController,
    required this.placaController,
  });

  setVagasTotais() {
    vagasTotais = int.parse(vagasController.text);
    notf();
  }

  addListObject(value1, value2, value3) {
    placa.add(value1);
    marca.add(value2);
    modelo.add(value3);
  }

  int vagasDisp() {
    return vagasTotais - placa.length;
  }

  clearAllList() {
    placa.clear();
    marca.clear();
    modelo.clear();
    notf();
  }

  removeListObject(int index) {
    placa.removeAt(index);
    marca.removeAt(index);
    modelo.removeAt(index);
    notf();
  }

  adicionar(context) async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('estacionamentos')
        .doc(placaController.text.toString())
        .set(
      {
        'marca': marcaController.text,
        'modelo': modeloController.text,
        'placa': placaController.text,
        'uid': uid,
      },
    ).then((value) {
      sucesso(context, 'Veículo adicionado com sucesso.');
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const FuncInterface()),
        ((route) => false),
      );
      clearControllers();
    }).catchError((e) {
      erro(context, 'Operação não sucedida');
      clearControllers();
      Navigator.pop(context);
    });
  }

  void remover(context, index) {
    FirebaseFirestore.instance
        .collection('estacionamentos')
        .doc(placa[index].toString())
        .delete()
        .then((res) {
      sucesso(context, 'Veículo removido com sucesso');
      removeListObject(index);
    }).catchError((e) {
      erro(context, 'Operação não sucedida');
    });
  }

  clearControllers() {
    marcaController.clear();
    modeloController.clear();
    placaController.clear();
    vagasController.clear();
    notf();
  }

  notf() {
    notifyListeners();
  }
}
