import 'package:camera/camera.dart';
import 'package:crypto_detect/adapters/permission_adapter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MediaRepository {
  final ImagePicker _picker = ImagePicker();
  final CameraDescription _camera;
  final PermissionsAdapter _permissionsAdapter;

  MediaRepository(
    this._permissionsAdapter,
    this._camera,
  );

  Future<bool> requestCameraAndGalleryPermissions() async {
    final cameraPermissionStatus = await _permissionsAdapter.requestCameraPermission();
    final photoPermissionStatus = await _permissionsAdapter.requestPhotoPermission();

    return cameraPermissionStatus.isGranted && photoPermissionStatus.isGranted;
  }

  CameraDescription cameraInit() {
    return _camera;
  }

  Future<XFile?> pickImage() {
    return _picker.pickImage(source: ImageSource.gallery);
  }
}