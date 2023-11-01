import 'dart:async';

import 'package:crypto_detect/domain/repository/sample_repository.dart';
import 'package:crypto_detect/presentation/entities/sample.dart';
import 'package:crypto_detect/presentation/mvvm/vm_abs.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class HistorySamplesState extends Equatable {
  final List<Sample> samples;

  const HistorySamplesState({
    this.samples = const [],
  });

  HistorySamplesState copyWith({
    List<Sample>? samples,
  }) {
    return HistorySamplesState(
      samples: samples ?? this.samples,
    );
  }

  @override
  List<Object?> get props => [samples];
}

enum HomeControlType {
  scan,
  history,
}

class HistorySampleViewModel extends ViewModel {
  final SampleRepository _sampleRepository;

  HistorySampleViewModel(this._sampleRepository);

  final _state = BehaviorSubject<HistorySamplesState>.seeded(const HistorySamplesState());

  @override
  void init() {
    fetchHistorySamples();
  }

  void onFeaturePressed(int type) {}

  void onControllerChange() {}

  void fetchHistorySamples() {
    _sampleRepository.getSamplesStream.listen((sample) {
      _state.add(HistorySamplesState(samples: sample));
    });
  }

  Stream<HistorySamplesState> get state => _state.stream;

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
//= [
// Sample(
//   image: base64Decode(
//       'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNk+M9DQRjG...'),
//   title: 'Ejemplo 1',
//   result: 'Resultado 1',
//   presentMicroorganism: true,
//   sampleDate: DateTime.now(),
// ),
// Sample(
//   image: base64Decode(
//       'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNk+M9DQRjG...'),
//   title: 'Ejemplo 2',
//   result: 'Resultado 2',
//   presentMicroorganism: false,
//   sampleDate: DateTime.now(),
// ),
// Sample(
//   image: base64Decode(
//       'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNk+M9DQRjG...'),
//   title: 'Ejemplo 3',
//   result: 'Resultado 3',
//   presentMicroorganism: true,
//   sampleDate: DateTime.now(),
// ),
