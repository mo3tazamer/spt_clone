import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_entity.freezed.dart';
part 'service_entity.g.dart';
@freezed
class ServiceEntity with _$ServiceEntity {
  const factory ServiceEntity({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "name_en") String? nameEn,
    @JsonKey(name: "name_ar") String? nameAr,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "description_en") String? descriptionEn,
    @JsonKey(name: "description_ar") String? descriptionAr,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "fee") String? fee,
    @JsonKey(name: "is_active") String? isActive,
  }) = _ServiceEntity;

  factory ServiceEntity.fromJson(Map<String, dynamic> json) =>
      _$ServiceEntityFromJson(json);
}
