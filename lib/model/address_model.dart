class AddressModel {
  final int? id;
  final int? user_id;
  final int? phone;
  final String? name;
  final String? village;
  final String? district;
  final String? province;
  final String? express;
  final String? branch;
  AddressModel({
    this.express,
    this.branch,
    this.id,
    this.user_id,
    this.phone,
    this.name,
    this.village,
    this.district,
    this.province,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'],
        user_id: json['user_id'],
        phone: int.parse(json['phone']),
        name: json['name'],
        village: json['village'],
        district: json['district'],
        province: json['province'],
        express: json['express'],
        branch: json['branch'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": user_id,
        "phone": phone,
        "name": name,
        "village": village,
        "district": district,
        "province": province,
        "express": express,
        "branch": branch,
      };
}
