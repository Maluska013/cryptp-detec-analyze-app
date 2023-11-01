import 'package:dio/dio.dart';

extension DioExtenssion on Dio {
  static Dio apiClient({
    String contentType = "application/json",
  }) {
    final headers = {
      "content-Type": contentType,
    };
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://fredogs.pythonanywhere.com",
        headers: headers,
        connectTimeout: const Duration(seconds: 10),
      ),
    );
    return dio;
  }
}
