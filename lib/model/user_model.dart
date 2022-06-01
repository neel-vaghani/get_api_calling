import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.users,
  });

  List<User>? users;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        users: json["users"] == null
            ? null
            : List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": users == null
            ? null
            : List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.createdAt,
    this.email,
    this.firstName,
    this.id,
    this.lastName,
    this.updatedAt,
  });

  DateTime? createdAt;
  String? email;
  String? firstName;
  String? id;
  String? lastName;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        id: json["id"] == null ? null : json["id"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "id": id == null ? null : id,
        "last_name": lastName == null ? null : lastName,
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
