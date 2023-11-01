import 'package:crypto_detect/remote_config/api_error.dart';

abstract class AppResponse<S> {
  const AppResponse();
  static AppResponse<S> success<S>(S result) => SuccessResult(result);
  static AppResponse<S> error<S>(ApiFailed error) => ErrorResult(error);

  T when<T>({required T Function(S s) onSuccess, required T Function(ApiFailed s) onError});
}

class SuccessResult<S> extends AppResponse<S> {
  final S data;

  SuccessResult(this.data);

  @override
  T when<T>({required T Function(S s) onSuccess, required T Function(ApiFailed s) onError}) {
    return onSuccess(data);
  }
}

class ErrorResult<S> extends AppResponse<S> {
  final ApiFailed error;

  ErrorResult(this.error);

  @override
  T when<T>({required T Function(S s) onSuccess, required T Function(ApiFailed s) onError}) {
    return onError(error);
  }
}
