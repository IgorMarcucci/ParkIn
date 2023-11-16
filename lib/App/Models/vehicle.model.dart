  import 'package:cloud_firestore/cloud_firestore.dart';

  class VehicleModel {
    String? id;
    String? parkId;
    String? carPlate;
    String? brandName;
    String? modelName;
    Timestamp? entryTime;
    Timestamp? exitTime;
    double? value;
    bool? active;

    VehicleModel({this.id, this.parkId, this.carPlate, this.brandName, this.modelName, this.entryTime, this.exitTime, this.value, this.active});

    VehicleModel.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      parkId = json['parkId'];
      carPlate = json['carPlate'];
      brandName = json['brandName'];
      modelName = json['modelName'];
      entryTime = json['entryTime'];
      exitTime = json['exitTime'];
      value = json['value'];
      active = json['active'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = id;
      data['parkId'] = parkId;
      data['carPlate'] = carPlate;
      data['brandName'] = brandName;
      data['modelName'] = modelName;
      data['entryTime'] = entryTime;
      data['exitTime'] = exitTime;
      data['value'] = value;
      data['active'] = active;
      return data;
    }

    @override
    String toString() {
      return '$active $brandName $carPlate $entryTime $exitTime $id $modelName $parkId $value';
    }

    factory VehicleModel.fromSnapshot(QueryDocumentSnapshot<Object?> snapshot) {
  Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
  return VehicleModel(
    id: data['id'].toString(),
    parkId: data['parkId'].toString(),
    carPlate: data['carPlate'].toString(),
    brandName: data['brandName'].toString(),
    modelName: data['modelName'].toString(),
    entryTime: data['entryTime'],
    exitTime: data['exitTime'],
    value: data['value'] is String ? double.parse(data['value']) : (data['value'] as num).toDouble(),
    active: data['active'],
  );
}

  }