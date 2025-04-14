class User {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  User({this.id, this.email, this.password, this.name, this.role, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'password': password,
    'name': name,
    'role': role,
    'avatar': avatar,
  };
}
