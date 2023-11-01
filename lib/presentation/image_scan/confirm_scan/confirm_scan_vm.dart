import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:crypto_detect/data/model/analyze_request_model.dart';
import 'package:crypto_detect/data/model/analyze_response_model.dart';
import 'package:crypto_detect/data/use_case/analyze_image_use_case.dart';
import 'package:crypto_detect/presentation/entities/sample.dart';
import 'package:crypto_detect/presentation/mvvm/vm_abs.dart';
import 'package:crypto_detect/presentation/route/app_router.dart';
import 'package:crypto_detect/presentation/route/route_spec.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/subjects.dart';

sealed class ConfirmScanEvent extends Equatable {
  const ConfirmScanEvent();
  @override
  List<Object?> get props => [];
}

class ShowLoading extends ConfirmScanEvent {
  const ShowLoading();
}

class ShowFailAnalyze extends ConfirmScanEvent {
  const ShowFailAnalyze();
}

class HideLoading extends ConfirmScanEvent {
  const HideLoading();
}

class ConfirmScanState extends Equatable {
  final bool request;
  final XFile? image;

  const ConfirmScanState({
    this.request = false,
    this.image,
  });

  ConfirmScanState copyWith({
    bool? request,
    XFile? image,
  }) {
    return ConfirmScanState(
      request: request ?? this.request,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        request,
        image,
      ];
}

class ConfirmScanViewModel extends ViewModel {
  final AnalyzeImageUseCase _analyzeImageUseCase;

  ConfirmScanViewModel(this._analyzeImageUseCase);

  final _state = BehaviorSubject<ConfirmScanState>.seeded(const ConfirmScanState());

  final _events = PublishSubject<ConfirmScanEvent>();

  final _routes = PublishSubject<RouteSpec>();

  @override
  void init() {}

  void onAnalyzeImage(XFile image) async {
    final imageAnalyze = await image.readAsBytes();
    final image64 = base64Encode(imageAnalyze);
    _events.add(const ShowLoading());
    await _analyzeImageUseCase(AnalyzeRequest(name: 'sample', data: image64)).then((result) {
      result.when(
        onSuccess: (data) => _navigateToAnalyze(data),
        onError: (error) => _failAnalyze,
      );
    });
  }

  void _navigateToAnalyze(AnalyzeResponse response) {
    _events.add(HideLoading());
    final bool isPresentMicroorganism = int.parse(response.objectsIdentified) > 1;
    final imageUint8list = base64Decode(response.image);
    _routes.add(
      RouteSpec.push(
        route: SampleDetailRoute(
          sample: Sample(
            image: imageUint8list,
            title: 'Sample',
            result: response.objectsIdentified,
            presentMicroorganism: isPresentMicroorganism,
            sampleDate: DateTime.now(),
          ),
        ),
      ),
    );
  }

  void _failAnalyze() {
    _events.add(const ShowFailAnalyze());
  }

  Stream<ConfirmScanState> get state => _state.stream;

  Stream<ConfirmScanEvent> get events => _events;

  Stream<RouteSpec> get router => _routes;

  @override
  void dispose() {
    _routes.close();
  }
}
