import 'package:crypto_detect/presentation/entities/sample.dart';

abstract class SampleRepository {
  void saveSample(Sample sample);
  Stream<List<Sample>> get getSamplesStream;
}
