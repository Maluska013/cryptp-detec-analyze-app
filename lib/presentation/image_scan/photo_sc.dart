import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:crypto_detect/presentation/image_scan/photo_vm.dart';
import 'package:crypto_detect/presentation/image_scan/widgets/take_pictre_button.dart';
import 'package:crypto_detect/presentation/mvvm/view_state.abs.dart';
import 'package:crypto_detect/presentation/route/app_router.dart';
import 'package:flutter/material.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({super.key});

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends ViewState<PhotoGalleryScreen, PhotoGalleryViewModel> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    viewModel.init();
    _controller = CameraController(viewModel.initCamera(), ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PhotoGalleryState>(
      stream: viewModel.state,
      builder: (BuildContext context, AsyncSnapshot<PhotoGalleryState> snapshot) {
        final state = snapshot.data ?? const PhotoGalleryState();
        return Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_controller);
                  } else {
                    return CameraPreview(_controller);
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TakePictureButton(
                  flashMode: state.flashMode,
                  onTakePhotoPressed: () {
                    _controller.takePicture().then((image) {
                      context.router.push(ConfirmScanRoute(image: image));
                    });
                  },
                  onSelectPhotoPressed: () {
                    viewModel.selectPhoto().then((image) {
                      if (image != null) {
                        context.router.push(ConfirmScanRoute(image: image));
                      }
                    });
                  },
                  onFlashPressed: () {
                    if (state.flashMode == FlashMode.off) {
                      _controller.setFlashMode(FlashMode.torch);
                      viewModel.setFlashMode(FlashMode.torch);
                    } else {
                      _controller.setFlashMode(FlashMode.off);
                      viewModel.setFlashMode(FlashMode.off);
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

//  Future<void> permissionDialog(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("permissions"),
//         content: Text('ypu must to get the permission to acces camera'),
//         actions: [
//           ElevatedButton(onPressed: () => openAppSettings, child: Text('allow')),
//           ElevatedButton(onPressed: () {}, child: Text('cancel'))
//         ],
//       ),
//     );
//   }
