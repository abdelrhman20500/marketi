
class BrandsModel {
  String? name;
  String? emoji;

  BrandsModel({this.name, this.emoji});

  BrandsModel.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["emoji"] is String) {
      emoji = json["emoji"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["emoji"] = emoji;
    return data;
  }
}