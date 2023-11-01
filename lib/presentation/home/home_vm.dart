import 'dart:async';

import 'package:crypto_detect/presentation/mvvm/vm_abs.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class HomeState extends Equatable {
  final int type;

  const HomeState({
    this.type = 1,
  });

  HomeState copyWith({
    int? type,
  }) {
    return HomeState(
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [type];
}

enum HomeControlType {
  scan,
  history,
}

class HomeViewModel extends ViewModel {
  HomeViewModel();
  final _state = BehaviorSubject<HomeState>.seeded(const HomeState());

  @override
  void init() {}

  void onFeaturePressed(int type) {
    _state.add(_state.value.copyWith(type: type));
  }

  void onControllerChange() {}

  Stream<HomeState> get state => _state.stream;

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
