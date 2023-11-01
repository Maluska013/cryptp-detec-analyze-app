import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_detect/design/theme/colors.dart';
import 'package:crypto_detect/design/theme/components/button.dart';
import 'package:crypto_detect/design/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class FailAnalyzeScreen extends StatefulWidget {
  final XFile image;

  const FailAnalyzeScreen({
    super.key,
    required this.image,
  });

  @override
  State<FailAnalyzeScreen> createState() => _FailAnalyzeScreenState();
}

class _FailAnalyzeScreenState extends State<FailAnalyzeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.grayTheme.black,
      appBar: AppBar(
        backgroundColor: Palette.grayTheme.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: double.maxFinite,
                height: 190,
                child: Image.file(
                  File(widget.image.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            'Esta muestra no es legible',
            style: context.theme.typo.button.copyWith(color: Palette.grayTheme.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'Comprueba que la imagen sea nítida, tenga la luz adecuada y no esté cortada.',
            style: context.theme.typo.button.copyWith(
              color: Palette.grayTheme.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10.0),
              AppButton(
                callback: () {
                  context.router.pop();
                },
                text: 'Tomar Nueva Imagen',
              )
            ],
          ),
        ),
      ),
    );
  }
}
