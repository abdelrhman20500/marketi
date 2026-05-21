
class LoginModel {
  String? message;
  String? token;
  User? user;

  LoginModel({this.message, this.token, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["token"] is String) {
      token = json["token"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    data["token"] = token;
    if(user != null) {
      data["user"] = user?.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? phone;
  String? email;
  String? role;
  String? image;

  User({this.name, this.phone, this.email, this.role, this.image});

  User.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["role"] is String) {
      role = json["role"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["phone"] = phone;
    data["email"] = email;
    data["role"] = role;
    data["image"] = image;
    return data;
  }
}