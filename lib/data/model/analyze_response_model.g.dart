// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyze_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyzeResponseImpl _$$AnalyzeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyzeResponseImpl(
      objectsIdentified: json['objects_identified'] as String,
      image: json['result_img'] as String,
    );

Map<String, dynamic> _$$AnalyzeResponseImplToJson(
        _$AnalyzeResponseImpl instance) =>
    <String, dynamic>{
      'objects_identified': instance.objectsIdentified,
      'result_img': instance.image,
    };
