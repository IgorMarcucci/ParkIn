import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/vehicle.model.dart';

class VehicleController extends ChangeNotifier {
  TextEditingController? placaController;
  TextEditingController? modeloController;
  TextEditingController? marcaController;
  List<VehicleModel> vehicleList = [];
  List<VehicleModel> filteredVehicleList = [];

  VehicleController({
    required this.marcaController,
    required this.modeloController,
    required this.placaController,
  });

  void addList(List<VehicleModel> value) {
    vehicleList = value;
    notf();
  }

  void clearList(){
    vehicleList.clear();
    notf();
  }

  void notf(){
    notifyListeners();
  }
}