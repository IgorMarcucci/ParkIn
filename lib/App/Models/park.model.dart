import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkModel {
  int? id;
  String? userId;
  String? name;
  int? qtd;
  int? currentQtd;
  String? address;
  LatLng? locale;

  ParkModel(
      {this.id, this.userId, this.name, this.qtd, this.currentQtd, this.address, this.locale});

  ParkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    qtd = json['qtd'];
    currentQtd = json['currentQtd'];
    address = json['address'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    data['qtd'] = qtd;
    data['currentQtd'] = currentQtd;
    data['address'] = address;
    data['locale'] = locale;
    return data;
  }

  factory ParkModel.fromSnapshot(QueryDocumentSnapshot<Object?> snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return ParkModel(
      id: data['id'],
      userId: data['userId'],
      name: data['name'],
      qtd: data['qtd'],
      currentQtd: data['currentQtd'],
      address: data['address'],
      locale: data['locale'],
    );
  }
}