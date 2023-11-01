import 'package:freezed_annotation/freezed_annotation.dart';

part 'analyze_response_model.freezed.dart';
part 'analyze_response_model.g.dart';

@Freezed(toJson: true)
class AnalyzeResponse with _$AnalyzeResponse {
  const factory AnalyzeResponse({
    @JsonKey(name: "objects_identified") required String objectsIdentified,
    @JsonKey(name: "result_img") required String image,
  }) = _AnalyzeResponse;
  factory AnalyzeResponse.fromJson(Map<String, Object?> json) => _$AnalyzeResponseFromJson(json);
}
