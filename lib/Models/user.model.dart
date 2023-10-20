class UserModel {
  String? uid;
  String? username;
  String? email;
  String? password;

  UserModel({this.uid, this.username, this.email, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;

    return data;
  }

  @override
  String toString() {
    return "$uid, $username, $email, $password";
  }
}
