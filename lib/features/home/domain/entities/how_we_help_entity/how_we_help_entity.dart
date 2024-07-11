import 'package:freezed_annotation/freezed_annotation.dart';

part 'how_we_help_entity.freezed.dart';
part 'how_we_help_entity.g.dart';

@freezed
class HowWeHelpEntity with _$HowWeHelpEntity {
  const factory HowWeHelpEntity({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'title_ar') String? titleAr,
    @JsonKey(name: 'title_en') String? titleEn,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'content_ar') String? contentAr,
    @JsonKey(name: 'content_en') String? contentEn,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'video') String? video,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'order') String? order,
  }) = _HowWeHelpEntity;

  factory HowWeHelpEntity.fromJson(Map<String, dynamic> json) =>
      _$HowWeHelpEntityFromJson(json);
}
