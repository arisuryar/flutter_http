class User {
  int id;
  String name;
  String username;
  String phone;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "phone": phone,
      };
}
