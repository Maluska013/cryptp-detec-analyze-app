import 'package:camera/camera.dart';
import 'package:crypto_detect/design/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TakePictureButton extends StatelessWidget {
  final VoidCallback onTakePhotoPressed;
  final VoidCallback onSelectPhotoPressed;
  final VoidCallback onFlashPressed;
  final FlashMode flashMode;

  const TakePictureButton({
    super.key,
    required this.onTakePhotoPressed,
    required this.onSelectPhotoPressed,
    required this.onFlashPressed,
    required this.flashMode,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 180,
          height: 46,
          decoration: BoxDecoration(
            color: Palette.grayTheme.black,
            borderRadius: BorderRadius.circular(54),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onSelectPhotoPressed,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Palette.blueTheme.blue400,
                  border: Border.all(color: Palette.grayTheme.black),
                  borderRadius: BorderRadius.circular(64),
                ),
                height: 32,
                width: 32,
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: onTakePhotoPressed,
              child: SizedBox(
                width: 56,
                height: 56,
                child: Image.asset('assets/actions.png'),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: onFlashPressed,
              child: Icon(
                flashMode == FlashMode.torch
                    ? PhosphorIconsFill.lightning
                    : PhosphorIconsLight.lightningSlash,
                color: Palette.grayTheme.white,
              ),
            )
          ],
        )
      ],
    );
  }
}
