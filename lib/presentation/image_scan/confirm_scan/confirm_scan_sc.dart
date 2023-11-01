import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:crypto_detect/design/theme/colors.dart';
import 'package:crypto_detect/design/theme/components/button.dart';
import 'package:crypto_detect/design/theme/theme.dart';
import 'package:crypto_detect/presentation/image_scan/confirm_scan/confirm_scan_vm.dart';
import 'package:crypto_detect/presentation/mvvm/view_state.abs.dart';
import 'package:crypto_detect/presentation/route/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ConfirmScanScreen extends StatefulWidget {
  final XFile image;

  const ConfirmScanScreen({
    super.key,
    required this.image,
  });

  @override
  State<ConfirmScanScreen> createState() => _ConfirmScanScreenState();
}

class _ConfirmScanScreenState extends ViewState<ConfirmScanScreen, ConfirmScanViewModel> {
  late StreamSubscription<ConfirmScanEvent> _subscription;

  @override
  void initState() {
    super.initState();
    listenToNavigation(viewModel.router);
    _subscription = viewModel.events.listen((event) {
      _listenEvents(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: viewModel.state,
        builder: (BuildContext context, AsyncSnapshot<ConfirmScanState> snapshot) {
          final state = snapshot.data ?? const ConfirmScanState();
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
                  '¿Quieres analizar esta muestra?',
                  textAlign: TextAlign.center,
                  style:
                      context.theme.typo.button.copyWith(color: Palette.grayTheme.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Comprueba que la imagen sea nítida, tenga la luz adecuada y no esté cortada.',
                  textAlign: TextAlign.center,
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
                    AppButton(
                      callback: () => viewModel.onAnalyzeImage(widget.image),
                      text: 'Analizar la muestra',
                      dark: false,
                    ),
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
        });
  }

  void _listenEvents(ConfirmScanEvent events) => switch (events) {
        ShowLoading() => _showLoadingDialog(context),
        ShowFailAnalyze() => FailAnalyzeRoute(image: widget.image),
        HideLoading() => context.router.popForced(),
      };

  Future<void> _showLoadingDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            surfaceTintColor: Palette.grayTheme.white,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                return Container(
                  color: Palette.grayTheme.white,
                  width: 200,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 140,
                        width: 140,
                        child: Image.asset('assets/loader.jpg'),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Estamos analizando tu muestra",
                        textAlign: TextAlign.center,
                        style: context.theme.typo.button.copyWith(
                          color: Palette.grayTheme.black,
                        ),
                      ),
                      LinearProgressIndicator(
                        color: Palette.grayTheme.white,
                        backgroundColor: Palette.grayTheme.black,
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
