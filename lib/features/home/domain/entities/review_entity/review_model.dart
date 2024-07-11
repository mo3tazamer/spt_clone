

import 'package:freezed_annotation/freezed_annotation.dart';
part 'review_model.freezed.dart';
part 'review_model.g.dart';


@freezed
class ReviewModel with _$ReviewModel{
  const factory ReviewModel({
    @JsonKey(name: "id")
     int? id,
    @JsonKey(name: "phone_image")
    String? phoneImage,
    @JsonKey(name: "web_image")
    String? webImage,


  }) = _ReviewModel;
  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);

}