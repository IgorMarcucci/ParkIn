import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/park.model.dart';
import 'package:flutter_app/App/Models/vehicle.model.dart';
import 'package:flutter_app/App/services/id.dart';

class VehicleController extends ChangeNotifier {
  TextEditingController? carPlateController;
  TextEditingController? modelController;
  TextEditingController? brandController;
  TextEditingController? valueController;
  List<VehicleModel> vehicleList = [];
  List<VehicleModel> filteredVehicleList = [];
  VehicleModel vehicle = VehicleModel();

  VehicleController({
    required this.brandController,
    required this.modelController,
    required this.carPlateController,
    required this.valueController
  });

  VehicleModel returnVehicleRegisterModel(ParkModel data){
    return VehicleModel(
      carPlate: carPlateController!.text,
      modelName: modelController!.text,
      brandName: brandController!.text,
      entryTime: Timestamp.now(),
      exitTime: null,
      value: 0,
      parkId: data.id,
      id: generateShortUniqueId(),
      active: true,
    );
  }

  Map<String, dynamic> setDataToVehicleRegister(ParkModel data){
    return {
      "collection": "vehicles",
      "body": returnVehicleRegisterModel(data).toJson(),
    };
  }

  VehicleModel returnChangeVehicleModel(ParkModel data, VehicleModel model){
    return VehicleModel(
      carPlate: model.carPlate,
      modelName: model.modelName,
      brandName: model.brandName,
      entryTime: model.entryTime,
      exitTime: Timestamp.now(),
      value: double.parse(valueController!
        .text
        .replaceAll('.', '')
        .replaceAll(',', '.')),
      parkId: model.parkId,
      id: model.id,
      active: false,
    );
  }

  Map<String, dynamic> setDataToChangeVehicle(ParkModel data, VehicleModel model){
    return {
      "collection": "vehicles",
      "body": returnChangeVehicleModel(data, model).toJson(),
    };
  }

  void addList(List<VehicleModel> value) {
    vehicleList = value;
    notf();
  }

  void filterList() {
    filteredVehicleList = vehicleList.where((element) => element.active == true).toList();
    notifyListeners();
  }


  void clearList(){
    vehicleList.clear();
    notf();
  }

  void notf(){
    notifyListeners();
  }

  void clearControllers(){
    carPlateController!.clear();
    modelController!.clear();
    brandController!.clear();
    notf();
  }

  List<VehicleModel> convertToVehicleList(
      List<QueryDocumentSnapshot<Object?>> snapshots) {
    return snapshots
        .map((snapshot) => VehicleModel.fromSnapshot(snapshot))
        .toList();
  }

  setDataToModel(VehicleModel data){
    vehicle = data;
    notifyListeners();
  }
}