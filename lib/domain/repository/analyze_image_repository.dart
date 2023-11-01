import 'package:crypto_detect/data/model/analyze_request_model.dart';
import 'package:crypto_detect/data/model/analyze_response_model.dart';
import 'package:crypto_detect/remote_config/app_response.dart';

abstract class AnalyzeImageRepository {
  Future<AppResponse<AnalyzeResponse>> analyzeResult(AnalyzeRequest request);
}
