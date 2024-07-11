// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';




class User {
  final String? id;
  final String? name;
  final String? phone;
  final String? avatar;
  final String? fcmToken;
  final bool? isActive;
  final List<String>? roles;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? ratingTotal;
  final int? ratingCount;
  final int? rating;
  final String? cityId;
  final String? lang;
  final dynamic email;
  final bool? hasPushNotifications;
  final bool? hasSmsNotifications;
  final bool? hasAbilityToVisuallyContactWithClient;
  final bool? hasAbilityToVocallyContactWithClient;
  final dynamic deletedAt;
  final dynamic permissionGroupId;

  User({
    this.id,
    this.name,
    this.phone,
    this.avatar,
    this.fcmToken,
    this.isActive,
    this.roles,
    this.createdAt,
    this.updatedAt,
    this.ratingTotal,
    this.ratingCount,
    this.rating,
    this.cityId,
    this.lang,
    this.email,
    this.hasPushNotifications,
    this.hasSmsNotifications,
    this.hasAbilityToVisuallyContactWithClient,
    this.hasAbilityToVocallyContactWithClient,
    this.deletedAt,
    this.permissionGroupId,
  });

  User copyWith({
    String? id,
    String? name,
    String? phone,
    String? avatar,
    String? fcmToken,
    bool? isActive,
    List<String>? roles,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? ratingTotal,
    int? ratingCount,
    int? rating,
    String? cityId,
    String? lang,
    dynamic email,
    bool? hasPushNotifications,
    bool? hasSmsNotifications,
    bool? hasAbilityToVisuallyContactWithClient,
    bool? hasAbilityToVocallyContactWithClient,
    dynamic deletedAt,
    dynamic permissionGroupId,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        avatar: avatar ?? this.avatar,
        fcmToken: fcmToken ?? this.fcmToken,
        isActive: isActive ?? this.isActive,
        roles: roles ?? this.roles,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ratingTotal: ratingTotal ?? this.ratingTotal,
        ratingCount: ratingCount ?? this.ratingCount,
        rating: rating ?? this.rating,
        cityId: cityId ?? this.cityId,
        lang: lang ?? this.lang,
        email: email ?? this.email,
        hasPushNotifications: hasPushNotifications ?? this.hasPushNotifications,
        hasSmsNotifications: hasSmsNotifications ?? this.hasSmsNotifications,
        hasAbilityToVisuallyContactWithClient: hasAbilityToVisuallyContactWithClient ?? this.hasAbilityToVisuallyContactWithClient,
        hasAbilityToVocallyContactWithClient: hasAbilityToVocallyContactWithClient ?? this.hasAbilityToVocallyContactWithClient,
        deletedAt: deletedAt ?? this.deletedAt,
        permissionGroupId: permissionGroupId ?? this.permissionGroupId,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    avatar: json["avatar"],
    fcmToken: json["fcm_token"],
    isActive: json["is_active"],
    roles: json["roles"] == null ? [] : List<String>.from(json["roles"]!.map((x) => x)),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    ratingTotal: json["rating_total"],
    ratingCount: json["rating_count"],
    rating: json["rating"],
    cityId: json["city_id"],
    lang: json["lang"],
    email: json["email"],
    hasPushNotifications: json["has_push_notifications"],
    hasSmsNotifications: json["has_sms_notifications"],
    hasAbilityToVisuallyContactWithClient: json["has_ability_to_visually_contact_with_client"],
    hasAbilityToVocallyContactWithClient: json["has_ability_to_vocally_contact_with_client"],
    deletedAt: json["deleted_at"],
    permissionGroupId: json["permission_group_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "avatar": avatar,
    "fcm_token": fcmToken,
    "is_active": isActive,
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "rating_total": ratingTotal,
    "rating_count": ratingCount,
    "rating": rating,
    "city_id": cityId,
    "lang": lang,
    "email": email,
    "has_push_notifications": hasPushNotifications,
    "has_sms_notifications": hasSmsNotifications,
    "has_ability_to_visually_contact_with_client": hasAbilityToVisuallyContactWithClient,
    "has_ability_to_vocally_contact_with_client": hasAbilityToVocallyContactWithClient,
    "deleted_at": deletedAt,
    "permission_group_id": permissionGroupId,
  };
}

