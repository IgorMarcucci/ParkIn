import 'package:cloud_firestore/cloud_firestore.dart';

class ParkModel {
  String? id;
  String? uid;
  String? name;
  int? qtd;
  int? currentQtd;
  String? address;
  GeoPoint? locale;

  ParkModel(
      {this.id, this.uid, this.name, this.qtd, this.currentQtd, this.address, this.locale});

  ParkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    qtd = json['qtd'];
    currentQtd = json['currentQtd'];
    address = json['address'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
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
      uid: data['uid'],
      name: data['name'],
      qtd: data['qtd'],
      currentQtd: data['currentQtd'],
      address: data['address'],
      locale: data['locale'],
    );
  }

  @override
  String toString() {
    return '$address $currentQtd $id $locale $name $qtd $uid';
  }
}