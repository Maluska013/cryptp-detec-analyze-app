import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Sample extends Equatable {
  final Uint8List image;
  final String title;
  final DateTime sampleDate;
  final String result;
  final bool presentMicroorganism;
  final String? observations;

  const Sample({
    required this.image,
    required this.title,
    required this.result,
    required this.presentMicroorganism,
    required this.sampleDate,
    this.observations = '',
  });

  Sample copyWith({
    Uint8List? image,
    String? title,
    DateTime? sampleDate,
    String? result,
    bool? presentMicroorganism,
    String? observations,
  }) {
    return Sample(
      image: image ?? this.image,
      title: title ?? this.title,
      sampleDate: sampleDate ?? this.sampleDate,
      result: result ?? this.result,
      presentMicroorganism: presentMicroorganism ?? this.presentMicroorganism,
      observations: observations ?? this.observations,
    );
  }

  @override
  List<Object?> get props => [
        image,
        title,
        result,
        presentMicroorganism,
        sampleDate,
        observations,
      ];
}
