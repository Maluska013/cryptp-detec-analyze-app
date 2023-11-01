import 'package:freezed_annotation/freezed_annotation.dart';

part 'analyze_request_model.freezed.dart';
part 'analyze_request_model.g.dart';

@Freezed()
class AnalyzeRequest with _$AnalyzeRequest {
  const factory AnalyzeRequest({
    required String name,
    required String data,
  }) = _AnalizeRequest;

  factory AnalyzeRequest.fromJson(Map<String, Object?> json) => _$AnalyzeRequestFromJson(json);
}
