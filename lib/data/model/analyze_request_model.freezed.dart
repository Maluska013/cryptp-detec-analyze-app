// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analyze_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnalyzeRequest _$AnalyzeRequestFromJson(Map<String, dynamic> json) {
  return _AnalizeRequest.fromJson(json);
}

/// @nodoc
mixin _$AnalyzeRequest {
  String get name => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyzeRequestCopyWith<AnalyzeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzeRequestCopyWith<$Res> {
  factory $AnalyzeRequestCopyWith(
          AnalyzeRequest value, $Res Function(AnalyzeRequest) then) =
      _$AnalyzeRequestCopyWithImpl<$Res, AnalyzeRequest>;
  @useResult
  $Res call({String name, String data});
}

/// @nodoc
class _$AnalyzeRequestCopyWithImpl<$Res, $Val extends AnalyzeRequest>
    implements $AnalyzeRequestCopyWith<$Res> {
  _$AnalyzeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalizeRequestImplCopyWith<$Res>
    implements $AnalyzeRequestCopyWith<$Res> {
  factory _$$AnalizeRequestImplCopyWith(_$AnalizeRequestImpl value,
          $Res Function(_$AnalizeRequestImpl) then) =
      __$$AnalizeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String data});
}

/// @nodoc
class __$$AnalizeRequestImplCopyWithImpl<$Res>
    extends _$AnalyzeRequestCopyWithImpl<$Res, _$AnalizeRequestImpl>
    implements _$$AnalizeRequestImplCopyWith<$Res> {
  __$$AnalizeRequestImplCopyWithImpl(
      _$AnalizeRequestImpl _value, $Res Function(_$AnalizeRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? data = null,
  }) {
    return _then(_$AnalizeRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalizeRequestImpl implements _AnalizeRequest {
  const _$AnalizeRequestImpl({required this.name, required this.data});

  factory _$AnalizeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalizeRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String data;

  @override
  String toString() {
    return 'AnalyzeRequest(name: $name, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalizeRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalizeRequestImplCopyWith<_$AnalizeRequestImpl> get copyWith =>
      __$$AnalizeRequestImplCopyWithImpl<_$AnalizeRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalizeRequestImplToJson(
      this,
    );
  }
}

abstract class _AnalizeRequest implements AnalyzeRequest {
  const factory _AnalizeRequest(
      {required final String name,
      required final String data}) = _$AnalizeRequestImpl;

  factory _AnalizeRequest.fromJson(Map<String, dynamic> json) =
      _$AnalizeRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get data;
  @override
  @JsonKey(ignore: true)
  _$$AnalizeRequestImplCopyWith<_$AnalizeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
