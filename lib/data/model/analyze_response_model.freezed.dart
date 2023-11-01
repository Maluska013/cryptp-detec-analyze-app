// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analyze_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnalyzeResponse _$AnalyzeResponseFromJson(Map<String, dynamic> json) {
  return _AnalyzeResponse.fromJson(json);
}

/// @nodoc
mixin _$AnalyzeResponse {
  @JsonKey(name: "objects_identified")
  String get objectsIdentified => throw _privateConstructorUsedError;
  @JsonKey(name: "result_img")
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyzeResponseCopyWith<AnalyzeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzeResponseCopyWith<$Res> {
  factory $AnalyzeResponseCopyWith(
          AnalyzeResponse value, $Res Function(AnalyzeResponse) then) =
      _$AnalyzeResponseCopyWithImpl<$Res, AnalyzeResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "objects_identified") String objectsIdentified,
      @JsonKey(name: "result_img") String image});
}

/// @nodoc
class _$AnalyzeResponseCopyWithImpl<$Res, $Val extends AnalyzeResponse>
    implements $AnalyzeResponseCopyWith<$Res> {
  _$AnalyzeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectsIdentified = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      objectsIdentified: null == objectsIdentified
          ? _value.objectsIdentified
          : objectsIdentified // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyzeResponseImplCopyWith<$Res>
    implements $AnalyzeResponseCopyWith<$Res> {
  factory _$$AnalyzeResponseImplCopyWith(_$AnalyzeResponseImpl value,
          $Res Function(_$AnalyzeResponseImpl) then) =
      __$$AnalyzeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "objects_identified") String objectsIdentified,
      @JsonKey(name: "result_img") String image});
}

/// @nodoc
class __$$AnalyzeResponseImplCopyWithImpl<$Res>
    extends _$AnalyzeResponseCopyWithImpl<$Res, _$AnalyzeResponseImpl>
    implements _$$AnalyzeResponseImplCopyWith<$Res> {
  __$$AnalyzeResponseImplCopyWithImpl(
      _$AnalyzeResponseImpl _value, $Res Function(_$AnalyzeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectsIdentified = null,
    Object? image = null,
  }) {
    return _then(_$AnalyzeResponseImpl(
      objectsIdentified: null == objectsIdentified
          ? _value.objectsIdentified
          : objectsIdentified // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyzeResponseImpl implements _AnalyzeResponse {
  const _$AnalyzeResponseImpl(
      {@JsonKey(name: "objects_identified") required this.objectsIdentified,
      @JsonKey(name: "result_img") required this.image});

  factory _$AnalyzeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyzeResponseImplFromJson(json);

  @override
  @JsonKey(name: "objects_identified")
  final String objectsIdentified;
  @override
  @JsonKey(name: "result_img")
  final String image;

  @override
  String toString() {
    return 'AnalyzeResponse(objectsIdentified: $objectsIdentified, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyzeResponseImpl &&
            (identical(other.objectsIdentified, objectsIdentified) ||
                other.objectsIdentified == objectsIdentified) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, objectsIdentified, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyzeResponseImplCopyWith<_$AnalyzeResponseImpl> get copyWith =>
      __$$AnalyzeResponseImplCopyWithImpl<_$AnalyzeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyzeResponseImplToJson(
      this,
    );
  }
}

abstract class _AnalyzeResponse implements AnalyzeResponse {
  const factory _AnalyzeResponse(
          {@JsonKey(name: "objects_identified")
          required final String objectsIdentified,
          @JsonKey(name: "result_img") required final String image}) =
      _$AnalyzeResponseImpl;

  factory _AnalyzeResponse.fromJson(Map<String, dynamic> json) =
      _$AnalyzeResponseImpl.fromJson;

  @override
  @JsonKey(name: "objects_identified")
  String get objectsIdentified;
  @override
  @JsonKey(name: "result_img")
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$AnalyzeResponseImplCopyWith<_$AnalyzeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
