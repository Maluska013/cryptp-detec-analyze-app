import 'package:crypto_detect/domain/repository/sample_repository.dart';
import 'package:crypto_detect/presentation/entities/sample.dart';
import 'package:rxdart/rxdart.dart';

class SampleRepositoryImplement implements SampleRepository {
  List<Sample> samples = [];

  final _sample = BehaviorSubject<List<Sample>>.seeded([]);

  @override
  void saveSample(Sample sample) {
    samples.add(sample);
    _sample.add(samples);
  }

  @override
  Stream<List<Sample>> get getSamplesStream => _sample;
}
