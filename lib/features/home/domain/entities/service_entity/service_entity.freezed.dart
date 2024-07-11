// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceEntity _$ServiceEntityFromJson(Map<String, dynamic> json) {
  return _ServiceEntity.fromJson(json);
}

/// @nodoc
mixin _$ServiceEntity {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "name_en")
  String? get nameEn => throw _privateConstructorUsedError;
  @JsonKey(name: "name_ar")
  String? get nameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "description_en")
  String? get descriptionEn => throw _privateConstructorUsedError;
  @JsonKey(name: "description_ar")
  String? get descriptionAr => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "fee")
  String? get fee => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  String? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceEntityCopyWith<ServiceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceEntityCopyWith<$Res> {
  factory $ServiceEntityCopyWith(
          ServiceEntity value, $Res Function(ServiceEntity) then) =
      _$ServiceEntityCopyWithImpl<$Res, ServiceEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "name_en") String? nameEn,
      @JsonKey(name: "name_ar") String? nameAr,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "description_en") String? descriptionEn,
      @JsonKey(name: "description_ar") String? descriptionAr,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "fee") String? fee,
      @JsonKey(name: "is_active") String? isActive});
}

/// @nodoc
class _$ServiceEntityCopyWithImpl<$Res, $Val extends ServiceEntity>
    implements $ServiceEntityCopyWith<$Res> {
  _$ServiceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? description = freezed,
    Object? descriptionEn = freezed,
    Object? descriptionAr = freezed,
    Object? image = freezed,
    Object? slug = freezed,
    Object? fee = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionEn: freezed == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionAr: freezed == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceEntityImplCopyWith<$Res>
    implements $ServiceEntityCopyWith<$Res> {
  factory _$$ServiceEntityImplCopyWith(
          _$ServiceEntityImpl value, $Res Function(_$ServiceEntityImpl) then) =
      __$$ServiceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "name_en") String? nameEn,
      @JsonKey(name: "name_ar") String? nameAr,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "description_en") String? descriptionEn,
      @JsonKey(name: "description_ar") String? descriptionAr,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "fee") String? fee,
      @JsonKey(name: "is_active") String? isActive});
}

/// @nodoc
class __$$ServiceEntityImplCopyWithImpl<$Res>
    extends _$ServiceEntityCopyWithImpl<$Res, _$ServiceEntityImpl>
    implements _$$ServiceEntityImplCopyWith<$Res> {
  __$$ServiceEntityImplCopyWithImpl(
      _$ServiceEntityImpl _value, $Res Function(_$ServiceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? description = freezed,
    Object? descriptionEn = freezed,
    Object? descriptionAr = freezed,
    Object? image = freezed,
    Object? slug = freezed,
    Object? fee = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$ServiceEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionEn: freezed == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionAr: freezed == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceEntityImpl implements _ServiceEntity {
  const _$ServiceEntityImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "name_en") this.nameEn,
      @JsonKey(name: "name_ar") this.nameAr,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "description_en") this.descriptionEn,
      @JsonKey(name: "description_ar") this.descriptionAr,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "slug") this.slug,
      @JsonKey(name: "fee") this.fee,
      @JsonKey(name: "is_active") this.isActive});

  factory _$ServiceEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceEntityImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "name_en")
  final String? nameEn;
  @override
  @JsonKey(name: "name_ar")
  final String? nameAr;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "description_en")
  final String? descriptionEn;
  @override
  @JsonKey(name: "description_ar")
  final String? descriptionAr;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "slug")
  final String? slug;
  @override
  @JsonKey(name: "fee")
  final String? fee;
  @override
  @JsonKey(name: "is_active")
  final String? isActive;

  @override
  String toString() {
    return 'ServiceEntity(id: $id, name: $name, nameEn: $nameEn, nameAr: $nameAr, description: $description, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, image: $image, slug: $slug, fee: $fee, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, nameEn, nameAr,
      description, descriptionEn, descriptionAr, image, slug, fee, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceEntityImplCopyWith<_$ServiceEntityImpl> get copyWith =>
      __$$ServiceEntityImplCopyWithImpl<_$ServiceEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceEntityImplToJson(
      this,
    );
  }
}

abstract class _ServiceEntity implements ServiceEntity {
  const factory _ServiceEntity(
          {@JsonKey(name: "id") final String? id,
          @JsonKey(name: "name") final String? name,
          @JsonKey(name: "name_en") final String? nameEn,
          @JsonKey(name: "name_ar") final String? nameAr,
          @JsonKey(name: "description") final String? description,
          @JsonKey(name: "description_en") final String? descriptionEn,
          @JsonKey(name: "description_ar") final String? descriptionAr,
          @JsonKey(name: "image") final String? image,
          @JsonKey(name: "slug") final String? slug,
          @JsonKey(name: "fee") final String? fee,
          @JsonKey(name: "is_active") final String? isActive}) =
      _$ServiceEntityImpl;

  factory _ServiceEntity.fromJson(Map<String, dynamic> json) =
      _$ServiceEntityImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "name_en")
  String? get nameEn;
  @override
  @JsonKey(name: "name_ar")
  String? get nameAr;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "description_en")
  String? get descriptionEn;
  @override
  @JsonKey(name: "description_ar")
  String? get descriptionAr;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "slug")
  String? get slug;
  @override
  @JsonKey(name: "fee")
  String? get fee;
  @override
  @JsonKey(name: "is_active")
  String? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$ServiceEntityImplCopyWith<_$ServiceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
