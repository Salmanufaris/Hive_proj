// ignore_for_file: unnecessary_new, prefer_collection_literals

class Model {
  int? id;
  String? email;
  String? firstname;
  String? lastname;
  String? image;

  Model(
      {required this.id,
      required this.email,
      required this.firstname,
      required this.lastname,
      required this.image});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        id: json["id"],
        email: json["email"],
        firstname: json["first_name"],
        lastname: json["last_name"],
        image: json["avatar"]);
  }
}
