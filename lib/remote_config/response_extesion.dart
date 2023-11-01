import 'package:crypto_detect/remote_config/api_error.dart';
import 'package:crypto_detect/remote_config/app_response.dart';

extension FutureExtension<S> on Future<S> {
  Future<AppResponse<S>> apiConverse() async {
    try {
      final value = await this;
      return AppResponse.success(value);
    } catch (error) {
      if (error is ApiError) {
        return AppResponse.error(error);
      } else if (error is GeneralError) {
        return AppResponse.error(error);
      }
    }
    return AppResponse.error(const GeneralError());
  }
}
