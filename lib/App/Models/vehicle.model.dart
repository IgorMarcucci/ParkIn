class VehicleModel {
  int? id;
  int? parkId;
  String? carPlate;
  String? brandName;
  String? modelName;
  DateTime? entryTime;
  DateTime? exitTime;
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
}