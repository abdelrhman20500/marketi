
class UserModel {
  Message? message;

  UserModel({this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is Map) {
      message = json["message"] == null ? null : Message.fromJson(json["message"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(message != null) {
      data["message"] = message?.toJson();
    }
    return data;
  }
}

class Message {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? image;

  Message({this.id, this.name, this.phone, this.email, this.address, this.image});

  Message.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["name"] = name;
    data["phone"] = phone;
    data["email"] = email;
    data["address"] = address;
    data["image"] = image;
    return data;
  }
}