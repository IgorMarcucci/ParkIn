import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/park.model.dart';
import 'package:flutter_app/App/Models/user.model.dart';
import 'package:flutter_app/App/services/id.dart';

class ParkController extends ChangeNotifier {
  TextEditingController? nameController; 
  TextEditingController? qtdController;
  TextEditingController? addressController;
  GeoPoint parkPosition = const GeoPoint(0, 0);
  int? totalParkSpace;
  int? currentPartSpace;
  ParkModel park = ParkModel(); 

  ParkController({
    required this.addressController,
    required this.qtdController,
    required this.nameController,
  });

  void changeParkPosition(double lat, double long) {
    parkPosition = GeoPoint(lat, long);
    notifyListeners();
  }

  void clearParkPosition() {
    parkPosition = const GeoPoint(0, 0);
    notifyListeners();
  }

  int listAvailableSpace(){
    return (park.qtd! - park.currentQtd!);
  }

  Map<String, dynamic> setDataToRegisterPark(UserModel value) {
    return {
      "collection": "parks",
      "body": returnParkModel(value).toJson(),
    };
  }

  Map<String, dynamic> setDataToChangePark() {
    return {
      "collection": "parks",
      "body": returnChangeInformationModel().toJson(),
    };
  }

  Map<String, dynamic> setDataToAddVehicleInPark() {
    return {
      "collection": "parks",
      "body": returnChangeAddVehicleModel().toJson(),
    };
  }

  Map<String, dynamic> setDataToRemoveVehicleInPark() {
    return {
      "collection": "parks",
      "body": returnChangeRemoveVehicleModel().toJson(),
    };
  }

  ParkModel returnParkModel(UserModel value){
    return ParkModel(
      name: nameController!.text,
      qtd: int.parse(qtdController!.text),
      currentQtd: 0,
      address: addressController!.text,
      locale: parkPosition == const GeoPoint(0, 0) ? const GeoPoint(-21.1860088700891, -47.83350443863764) : parkPosition,
      id: generateShortUniqueId(),
      uid: value.uid,
    );
  }

  ParkModel returnChangeInformationModel(){
    return ParkModel(
      name: park.name,
      qtd: int.parse(qtdController!.text),
      currentQtd: park.currentQtd,
      address: park.address,
      locale: park.locale,
      uid: park.uid,
      id: park.id,
    );
  }

  ParkModel returnChangeAddVehicleModel(){
    return ParkModel(
      name: park.name,
      qtd: park.qtd,
      currentQtd: (park.currentQtd! + 1),
      address: park.address,
      locale: park.locale,
      uid: park.uid,
      id: park.id,
    );
  }

  ParkModel returnChangeRemoveVehicleModel(){
    return ParkModel(
      name: park.name,
      qtd: park.qtd,
      currentQtd: (park.currentQtd! - 1),
      address: park.address,
      locale: park.locale,
      uid: park.uid,
      id: park.id,
    );
  }

  void addList(List<ParkModel> value){
    park = value[0];
    notifyListeners();
  }

  void clearList(){
    park = ParkModel();
    notifyListeners();
  }
  
  List<ParkModel> convertToParkList(
      List<QueryDocumentSnapshot<Object?>> snapshots) {
    return snapshots
        .map((snapshot) => ParkModel.fromSnapshot(snapshot))
        .toList();
  }

  clearControllers(){
    addressController!.clear();
    nameController!.clear();
    qtdController!.clear();
    notifyListeners();
  }
}
