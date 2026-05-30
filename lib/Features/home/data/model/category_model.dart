
class CategoryModel {
  String? slug;
  String? name;
  String? url;
  String? image;

  CategoryModel({this.slug, this.name, this.url, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["slug"] = slug;
    data["name"] = name;
    data["url"] = url;
    data["image"] = image;
    return data;
  }
}