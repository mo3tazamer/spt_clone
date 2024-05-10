// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User extends Equatable {
  final bool success;
  final String message;
  final Data data;

  const User({
    required this.success,
    required this.message,
    required this.data,
  });

  User copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      User(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [success, message, data];
}

class Data extends Equatable {
  final UserClass user;
  final Token token;

  const Data({
    required this.user,
    required this.token,
  });

  Data copyWith({
    UserClass? user,
    Token? token,
  }) =>
      Data(
        user: user ?? this.user,
        token: token ?? this.token,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: UserClass.fromJson(json["user"]),
        token: Token.fromJson(json["token"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [user, token];
}

class Token extends Equatable {
  final String token;

  const Token({
    required this.token,
  });

  Token copyWith({
    String? token,
  }) =>
      Token(
        token: token ?? this.token,
      );

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}

class UserClass extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String avatar;
  final dynamic fcmToken;
  final bool isActive;
  final List<String> roles;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserClass({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.avatar,
    required this.fcmToken,
    required this.isActive,
    required this.roles,
    required this.createdAt,
    required this.updatedAt,
  });

  UserClass copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? avatar,
    dynamic fcmToken,
    bool? isActive,
    List<String>? roles,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserClass(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        avatar: avatar ?? this.avatar,
        fcmToken: fcmToken ?? this.fcmToken,
        isActive: isActive ?? this.isActive,
        roles: roles ?? this.roles,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        avatar: json["avatar"],
        fcmToken: json["fcm_token"],
        isActive: json["is_active"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "avatar": avatar,
        "fcm_token": fcmToken,
        "is_active": isActive,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        phone,
        avatar,
        fcmToken,
        isActive,
        roles,
        createdAt,
        updatedAt
      ];
}
