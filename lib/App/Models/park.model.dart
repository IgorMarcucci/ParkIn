class ParkModel {
  int? id;
  int? userId;
  String? name;
  int? qtd;
  String? address;
  String? locale;

  ParkModel(
      {this.id, this.userId, this.name, this.qtd, this.address, this.locale});

  ParkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    qtd = json['qtd'];
    address = json['address'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    data['qtd'] = qtd;
    data['address'] = address;
    data['locale'] = locale;
    return data;
  }
}