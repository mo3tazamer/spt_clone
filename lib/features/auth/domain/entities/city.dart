import 'dart:convert';

CityEntity welcomeFromJson(String str) => CityEntity.fromJson(json.decode(str));

String welcomeToJson(CityEntity data) => json.encode(data.toJson());

class CityEntity {
  final String? id;
  final String? name;

  const CityEntity({
    this.id,
    this.name,
  });

  CityEntity copyWith({
    String? id,
    String? name,
  }) =>
      CityEntity(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory CityEntity.fromJson(Map<String, dynamic> json) => CityEntity(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
