import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/park.model.dart';
import 'package:flutter_app/App/Models/user.model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkController extends ChangeNotifier {
  TextEditingController? nameController; 
  TextEditingController? qtdController;
  TextEditingController? addressController;
  LatLng parkPosition = const LatLng(0, 0);
  int? totalParkSpace;
  int? currentPartSpace;
  List<ParkModel> parkList = [];

  ParkController({
    required this.addressController,
    required this.qtdController,
    required this.nameController,
  });

  void changeParkPosition(double lat, double long) {
    parkPosition = LatLng(lat, long);
    notifyListeners();
  }

  void clearParkPosition() {
    parkPosition = const LatLng(0, 0);
    notifyListeners();
  }

  int listAvailableSpace(int parkSpace){
    return (totalParkSpace! - parkSpace);
  }

  ParkModel returnParkModel(UserModel value){
    return ParkModel(
      name: nameController!.text,
      qtd: int.parse(qtdController!.text),
      currentQtd: 0,
      address: addressController!.text,
      locale: parkPosition,
      userId: value.uid,
    );
  }

  Map<String, dynamic> returnRegisterParkModel(UserModel value) {
    return {
      "collection": "parks",
      "body": returnParkModel(value),
    };
  }

  Map<String, dynamic> returnChangeInfoParkModel(UserModel value) {
    return {
      "collection": "parks",
      "body": returnChangeInformationModel(value),
    };
  }

  ParkModel returnChangeInformationModel(UserModel value){
    return ParkModel(
      name: nameController!.text,
      qtd: int.parse(qtdController!.text),
      currentQtd: currentPartSpace,
      address: addressController!.text,
      locale: parkPosition,
      userId: value.uid,
    );
  }

  void addList(List<ParkModel> value){
    parkList = value;
    notifyListeners();
  }

  void clearList(){
    parkList.clear();
    notifyListeners();
  }
  
  List<ParkModel> convertToParkList(
      List<QueryDocumentSnapshot<Object>> snapshots) {
    return snapshots
        .map((snapshot) => ParkModel.fromSnapshot(snapshot))
        .toList();
  }
}
