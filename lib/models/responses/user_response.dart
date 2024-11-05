import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? username;
  final dynamic phone;
  final String? gender;
  final bool? isStaff;
  final bool? isSuperuser;
  final bool? isAdmin;
  final bool? isActive;
  final DateTime? lastLogin;
  final List<dynamic>? groups;

  UserResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.phone,
    this.gender,
    this.isStaff,
    this.isSuperuser,
    this.isAdmin,
    this.isActive,
    this.lastLogin,
    this.groups,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        username: json["username"],
        phone: json["phone"],
        gender: json["gender"],
        isStaff: json["is_staff"],
        isSuperuser: json["is_superuser"],
        isAdmin: json["is_admin"],
        isActive: json["is_active"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        groups: json["groups"] == null
            ? []
            : List<dynamic>.from(json["groups"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "username": username,
        "phone": phone,
        "gender": gender,
        "is_staff": isStaff,
        "is_superuser": isSuperuser,
        "is_admin": isAdmin,
        "is_active": isActive,
        "last_login": lastLogin?.toIso8601String(),
        "groups":
            groups == null ? [] : List<dynamic>.from(groups!.map((x) => x)),
      };
}
