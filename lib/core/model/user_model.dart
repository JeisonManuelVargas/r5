class UserModel {
  String id;
  String email;
  String phone;
  String password;

  UserModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.password,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? phone,
    String? password,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );

  factory UserModel.fromJson(json, String id) => UserModel(
        id: id,
        password: "",
        email: json["email"],
        phone: json["phone"],
      );

  factory UserModel.init() => UserModel(
        id: "",
        email: "",
        phone: "",
        password: "",
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
      };
}
