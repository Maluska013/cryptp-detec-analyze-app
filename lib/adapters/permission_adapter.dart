import 'package:permission_handler/permission_handler.dart';

abstract class PermissionsAdapter {
  Future<PermissionStatus> requestCameraPermission();
  Future<PermissionStatus> requestPhotoPermission();
}

class PermissionsAdapterImpl extends PermissionsAdapter {
  PermissionsAdapterImpl();

  @override
  Future<PermissionStatus> requestCameraPermission() {
    return Permission.camera.request();
  }

  @override
  Future<PermissionStatus> requestPhotoPermission() {
    return Permission.mediaLibrary.request();
  }
}
