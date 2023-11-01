import 'dart:async';

import 'package:crypto_detect/domain/repository/sample_repository.dart';
import 'package:crypto_detect/presentation/entities/sample.dart';
import 'package:crypto_detect/presentation/mvvm/vm_abs.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class SampleDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShowLoadingAnalyze extends SampleDetailEvent {
  ShowLoadingAnalyze();
}

class ShowErrorAnalyze extends SampleDetailEvent {
  ShowErrorAnalyze();
}

class SampleDetailState extends Equatable {
  final Sample sample;
  final bool? showEdit;

  const SampleDetailState({
    required this.sample,
    this.showEdit,
  });

  SampleDetailState copyWith({
    Sample? sample,
    bool? showEdit,
  }) {
    return SampleDetailState(
      sample: sample ?? this.sample,
      showEdit: showEdit ?? this.showEdit,
    );
  }

  @override
  List<Object?> get props => [sample, showEdit];
}

class SampleDetailViewModel extends ViewModel {
  final SampleRepository _sampleRepository;

  SampleDetailViewModel(
    this._sampleRepository,
  );

  final _state = BehaviorSubject<SampleDetailState>();

  @override
  void init() {}

  void initSample(Sample sample) {
    _state.add(SampleDetailState(sample: sample));
  }

  void observations(String observation) {
    final newSample = _state.value.sample.copyWith(observations: observation);
    _state.add(_state.value.copyWith(sample: newSample));
  }

  void onEditTap() {
    _state.add(_state.value.copyWith(showEdit: true));
  }

  void onSaveSample(Sample sample) {
    _sampleRepository.saveSample(sample);
  }

  Stream<SampleDetailState> get state => _state.stream;

  @override
  void dispose() {
    _state.close();
  }
}
