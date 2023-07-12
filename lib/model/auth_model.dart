class AuthModel {
  final String? id;
  final String? name;
  final String? surname;
  final String? dob;

  AuthModel({
    this.id,
    this.name,
    this.surname,
    this.dob,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        id: json['id'],
        name: json['name'],
        surname: json['surname'],
        dob: json['dob'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "dob": dob,
      };
}
