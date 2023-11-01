import 'package:camera/camera.dart';
import 'package:crypto_detect/domain/repository/media_repository.dart';
import 'package:crypto_detect/presentation/mvvm/vm_abs.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/subjects.dart';

class PhotoGalleryEvents extends Equatable {
  const PhotoGalleryEvents();

  @override
  List<Object?> get props => [];
}

class HandleCameraPermissionEvent extends PhotoGalleryEvents {
  const HandleCameraPermissionEvent();
}

class ShowSelectedImageWarning extends PhotoGalleryEvents {
  const ShowSelectedImageWarning();
}

class PhotoGalleryState extends Equatable {
  final bool cameraStatus;
  final XFile? image;
  final FlashMode flashMode;

  const PhotoGalleryState({
    this.cameraStatus = false,
    this.image,
    this.flashMode = FlashMode.off,
  });

  PhotoGalleryState copyWith({
    bool? cameraStatus,
    XFile? image,
    FlashMode? flashMode,
  }) {
    return PhotoGalleryState(
      cameraStatus: cameraStatus ?? this.cameraStatus,
      image: image ?? this.image,
      flashMode: flashMode ?? this.flashMode,
    );
  }

  @override
  List<Object?> get props => [
        cameraStatus,
        image,
        flashMode,
      ];
}

class PhotoGalleryViewModel extends ViewModel {
  final MediaRepository _mediaRepository;

  PhotoGalleryViewModel(this._mediaRepository);

  final _state =
      BehaviorSubject<PhotoGalleryState>.seeded(const PhotoGalleryState());

  final _events = PublishSubject<PhotoGalleryEvents>();

  @override
  void init() {
    permissionEvent();
  }

  void permissionEvent() {
    _events.add(const HandleCameraPermissionEvent());
  }

  Future<void> requiredPermissionsState() async {
    final bool requestResult =
        await _mediaRepository.requestCameraAndGalleryPermissions();
    _state.add(_state.value.copyWith(cameraStatus: requestResult));
  }

  CameraDescription initCamera() {
    return _mediaRepository.cameraInit();
  }

  void photo(XFile photo) {
    _state.add(_state.value.copyWith(image: photo));
  }

  Future<XFile?> selectPhoto() async {
    final cameraAuthorized = _state.value.cameraStatus;
    if (cameraAuthorized == true) {
      final XFile? photo = await _mediaRepository.pickImage();
      if (photo != null) {
        return photo;
      } else {
        showSelectedImageWarning();
      }
    } else {
      requiredPermissionsState();
    }
    return null;
  }

  void showSelectedImageWarning() {
    _events.add(const ShowSelectedImageWarning());
  }

  void setFlashMode(FlashMode flashMode) {
    _state.add(_state.value.copyWith(flashMode: flashMode));
  }

  // Future<void> takePhoto() async {
  //   final photo = await _mediaRepository.takePhoto();
  //   _state.add(_state.value.copyWith(image: photo));
  // }
  //
  //
  // Future<void> onTakePhoto() async {
  //   //   final cameraAuthorized = _state.value.cameraStatus;
  //   //   if (cameraAuthorized == true) {
  //   //     await takePhoto();
  //   //   }
  //   //   await requiredPermissionsState();
  //   // }

  Stream<PhotoGalleryState> get state => _state.stream;

  Stream<PhotoGalleryEvents> get events => _events;

  // Stream<CameraDescription> get camera => _camera;

  @override
  void dispose() {}
}
