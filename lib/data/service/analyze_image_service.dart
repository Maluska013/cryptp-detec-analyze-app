import 'package:crypto_detect/data/endpoint/analyze_image_endpoint.dart';
import 'package:crypto_detect/data/model/analyze_request_model.dart';
import 'package:crypto_detect/data/model/analyze_response_model.dart';

class AnalyzeImageService {
  final AnalyzeImageEndpoint _analyzeImageEndpoint;

  AnalyzeImageService(this._analyzeImageEndpoint);

  Future<AnalyzeResponse> analyzeImage(AnalyzeRequest request) {
    return _analyzeImageEndpoint.analyzeImageRequest(request);
  }
}
