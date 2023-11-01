import 'package:crypto_detect/data/model/analyze_request_model.dart';
import 'package:crypto_detect/data/model/analyze_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'analyze_image_endpoint.g.dart';

@RestApi()
abstract class AnalyzeImageEndpoint {
  factory AnalyzeImageEndpoint(Dio dio, {String? baseUrl}) = _AnalyzeImageEndpoint;

  @POST("/img")
  Future<AnalyzeResponse> analyzeImageRequest(@Body() AnalyzeRequest request);
}
