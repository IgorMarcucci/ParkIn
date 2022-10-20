import 'package:flutter/material.dart';

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

  addListObject() {
    placa.add(placaController.text);
    marca.add(marcaController.text);
    modelo.add(modeloController.text);
  }

  removeListObject(int index) {
    placa.removeAt(index);
    marca.removeAt(index);
    modelo.removeAt(index);
    notf();
  }

  // clearVeiculosController() {
  //   marcaController.clear();
  //   modeloController.clear();
  //   placaController.clear();
  //   vagasController.clear();
  //   notf();
  // }

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
