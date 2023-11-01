import 'package:equatable/equatable.dart';

abstract class ApiFailed extends Equatable implements Exception {
  final Object? object;

  const ApiFailed({this.object});

  @override
  String toString() => '$runtimeType Exception';

  @override
  List<Object> get props => [];
}

class ApiError extends ApiFailed {
  final int statusCode;
  const ApiError({Object? object, required this.statusCode}) : super(object: object);
}

class GeneralError extends ApiFailed {
  const GeneralError({Object? object}) : super(object: object);
}
