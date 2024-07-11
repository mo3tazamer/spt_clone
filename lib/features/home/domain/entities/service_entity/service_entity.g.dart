// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceEntityImpl _$$ServiceEntityImplFromJson(Map<String, dynamic> json) =>
    _$ServiceEntityImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      nameEn: json['name_en'] as String?,
      nameAr: json['name_ar'] as String?,
      description: json['description'] as String?,
      descriptionEn: json['description_en'] as String?,
      descriptionAr: json['description_ar'] as String?,
      image: json['image'] as String?,
      slug: json['slug'] as String?,
      fee: json['fee'] as String?,
      isActive: json['is_active'] as String?,
    );

Map<String, dynamic> _$$ServiceEntityImplToJson(_$ServiceEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_en': instance.nameEn,
      'name_ar': instance.nameAr,
      'description': instance.description,
      'description_en': instance.descriptionEn,
      'description_ar': instance.descriptionAr,
      'image': instance.image,
      'slug': instance.slug,
      'fee': instance.fee,
      'is_active': instance.isActive,
    };
