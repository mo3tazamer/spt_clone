class NotificationEntity {
  final String? id;
  final Body? title;
  final Body? body;
  final String? action;
  final ActionData? actionData;
  final DateTime? readAt;
  final DateTime? createdAt;

  NotificationEntity({
    this.id,
    this.title,
    this.body,
    this.action,
    this.actionData,
    this.readAt,
    this.createdAt,
  });

  NotificationEntity copyWith({
    String? id,
    Body? title,
    Body? body,
    String? action,
    ActionData? actionData,
    DateTime? readAt,
    DateTime? createdAt,
  }) =>
      NotificationEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        action: action ?? this.action,
        actionData: actionData ?? this.actionData,
        readAt: readAt ?? this.readAt,
        createdAt: createdAt ?? this.createdAt,
      );

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      NotificationEntity(
        id: json["id"],
        title: json["title"] == null ? null : Body.fromJson(json["title"]),
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
        action: json["action"],
        actionData: json["action_data"] == null
            ? null
            : ActionData.fromJson(json["action_data"]),
        readAt:
            json["read_at"] == null ? null : DateTime.parse(json["created_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title?.toJson(),
        "body": body?.toJson(),
        "action": action,
        "action_data": actionData?.toJson(),
        "read_at": readAt,
        "created_at": createdAt?.toIso8601String(),
      };
}

class ActionData {
  final String? id;
  final String? userId;
  final String? orderId;
  final String? status;
  final num? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User? user;

  ActionData({
    this.id,
    this.userId,
    this.orderId,
    this.status,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  ActionData copyWith({
    String? id,
    String? userId,
    String? orderId,
    String? status,
    double? price,
    DateTime? createdAt,
    DateTime? updatedAt,
    User? user,
  }) =>
      ActionData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        orderId: orderId ?? this.orderId,
        status: status ?? this.status,
        price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        user: user ?? this.user,
      );

  factory ActionData.fromJson(Map<String, dynamic> json) => ActionData(
        id: json["id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        status: json["status"],
        price: json["price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_id": orderId,
        "status": status,
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

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
  final num? ratingTotal;
  final num? ratingCount;
  final num? rating;
  final String? cityId;
  final String? lang;

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
    num? ratingTotal,
    num? ratingCount,
    num? rating,
    String? cityId,
    String? lang,
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
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        avatar: json["avatar"],
        fcmToken: json["fcm_token"],
        isActive: json["is_active"],
        roles: json["roles"] == null
            ? []
            : List<String>.from(json["roles"]!.map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        ratingTotal: json["rating_total"],
        ratingCount: json["rating_count"],
        rating: json["rating"],
        cityId: json["city_id"],
        lang: json["lang"],
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
      };
}

class Body {
  final String? ar;
  final String? en;

  Body({
    this.ar,
    this.en,
  });

  Body copyWith({
    String? ar,
    String? en,
  }) =>
      Body(
        ar: ar ?? this.ar,
        en: en ?? this.en,
      );

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        ar: json["ar"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}
