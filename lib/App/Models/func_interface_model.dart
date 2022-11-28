import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/scaffold_messages.dart';

String md5RandomString() {
  final randomNumber = Random().nextDouble();
  final randomBytes = utf8.encode(randomNumber.toString());
  final randomString = md5.convert(randomBytes).toString();
  return randomString;
}

class FuncInterfaceModel extends ChangeNotifier {
  int vagasTotais = 0;
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

  addListObject() {
    placa.add(placaController.text);
    marca.add(marcaController.text);
    modelo.add(modeloController.text);
  }

  bool incrementVagasDisp() {
    if (vagasOcupadas > 0) {
      vagasOcupadas--;
      notf();
    }
    return false;
  }

  bool incrementVagasOcup() {
    if (vagasOcupadas < vagasTotais) {
      vagasOcupadas++;
      notf();
    }
    return false;
  }

  int vagasDisp() {
    return vagasTotais - vagasOcupadas;
  }

  removeListObject(int index) {
    placa.removeAt(index);
    marca.removeAt(index);
    modelo.removeAt(index);
    notf();
  }

  adicionar(context) async{
    var uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('estacionamentos').doc(placaController.text.toString()).set(
        {
          'marca': marcaController.text,
          'modelo': modeloController.text,
          'placa': placaController.text,
          'uid': uid,
        },
      ).then((value) {
        sucesso(context, 'Veículo adicionado com sucesso.');
        addListObject();
        Navigator.pop(context);
        clearControllers();
      }
    ).catchError((e){
      erro(context, 'Operação não sucedida');
      clearControllers();
    });
  }

  void remover(context, index) {
    FirebaseFirestore.instance.collection('estacionamentos').doc(placa[index].toString()).delete()
    .then((res) {
      sucesso(context, 'Veículo removido com sucesso');
      removeListObject(index);
    }).catchError((e){
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
