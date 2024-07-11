// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'how_we_help_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HowWeHelpEntityImpl _$$HowWeHelpEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$HowWeHelpEntityImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      titleAr: json['title_ar'] as String?,
      titleEn: json['title_en'] as String?,
      content: json['content'] as String?,
      contentAr: json['content_ar'] as String?,
      contentEn: json['content_en'] as String?,
      image: json['image'] as String?,
      video: json['video'] as String?,
      type: json['type'] as String?,
      order: json['order'] as String?,
    );

Map<String, dynamic> _$$HowWeHelpEntityImplToJson(
        _$HowWeHelpEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_ar': instance.titleAr,
      'title_en': instance.titleEn,
      'content': instance.content,
      'content_ar': instance.contentAr,
      'content_en': instance.contentEn,
      'image': instance.image,
      'video': instance.video,
      'type': instance.type,
      'order': instance.order,
    };
