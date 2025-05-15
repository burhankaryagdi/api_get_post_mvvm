class SignUpModel {
  String name;
  String email;
  String password;
  String avatar;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json["name"],
      email: json["email"],
      password: json["password"],
      avatar: json["avatar"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "avatar": avatar,
  };
}
